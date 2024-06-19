using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Widget;
using AndroidX.AppCompat.App;
using Google.Android.Material.BottomNavigation;
using Android.Views;
using PhirApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Android.Graphics;
using Android.Util;
using Firebase.Messaging;
using Android.Webkit;
using AndroidX.AppCompat.Widget;
using AndroidWidgetToolbar = Android.Widget.Toolbar;
using AndroidXAppCompatToolbar = AndroidX.AppCompat.Widget.Toolbar;

namespace PhirAPP
{
    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme")]
    public class MainActivity : AppCompatActivity, BottomNavigationView.IOnNavigationItemSelectedListener
    {
        TextView textMessage;
        WebView webView;
        ListView listView;
        ListView listViewNot;
        private string username;
        private ProgressBar progressBar;
        private List<Notification> notifications;
        private AndroidXAppCompatToolbar toolbar;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_main);

            // Setup Toolbar
            toolbar = FindViewById<AndroidXAppCompatToolbar>(Resource.Id.toolbar);
            SetSupportActionBar(toolbar);

            // Initialize Firebase messaging
            FirebaseMessaging.Instance.SubscribeToTopic("articles")
                .AddOnCompleteListener(new OnCompleteListener());

            // Get username from shared preferences
            ISharedPreferences sharedPreferences = GetSharedPreferences("app_settings", FileCreationMode.Private);
            username = sharedPreferences.GetString("username", null);

            if (string.IsNullOrEmpty(username))
            {
                Toast.MakeText(this, "Por favor, inicia sesión para continuar.", ToastLength.Short).Show();
                Finish();
                return;
            }

            FirebaseMessaging.Instance.SubscribeToTopic(username)
                .AddOnCompleteListener(new OnCompleteListener());

            SetupViews();
            LoadHomePage();

            // Check if started from a notification
            if (Intent.HasExtra("articleId") && Intent.HasExtra("parentId"))
            {
                int articleId = Intent.GetIntExtra("articleId", -1);
                int parentId = Intent.GetIntExtra("parentId", -1);
                if (articleId != -1 && parentId != -1)
                {
                    Task.Run(() => NavigateToArticleDirectly(articleId));
                }
            }
        }

        public override bool OnCreateOptionsMenu(IMenu menu)
        {
            MenuInflater.Inflate(Resource.Menu.menu_main, menu);
            return true;
        }

        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            switch (item.ItemId)
            {
                case Resource.Id.action_clear_notifications:
                    ClearAllNotifications();
                    return true;
                default:
                    return base.OnOptionsItemSelected(item);
            }
        }
        private async void ClearAllNotifications()
        {
            try
            {
                await ApiService.DeleteAllNotificationsAsync(); // Asumiendo que tienes un método en ApiService para eliminar todas las notificaciones
                notifications.Clear();
                var adapter = (NotificationAdapter)listViewNot.Adapter;
                adapter.NotifyDataSetChanged();
                Toast.MakeText(this, "Notificaciones descartadas", ToastLength.Short).Show();
            }
            catch (Exception ex)
            {
                Log.Error("MainActivity", "Error clearing notifications: " + ex.Message);
                Toast.MakeText(this, "Error al descartar notificaciones", ToastLength.Short).Show();
            }
        }


        private void SetupViews()
        {
            textMessage = FindViewById<TextView>(Resource.Id.message);
            webView = FindViewById<WebView>(Resource.Id.webView);
            listView = FindViewById<ListView>(Resource.Id.articleListView);
            listViewNot = FindViewById<ListView>(Resource.Id.notificationListView);
            BottomNavigationView navigation = FindViewById<BottomNavigationView>(Resource.Id.navigation);
            progressBar = FindViewById<ProgressBar>(Resource.Id.progressBar);
            navigation.SetOnNavigationItemSelectedListener(this);
        }

        private class OnCompleteListener : Java.Lang.Object, Android.Gms.Tasks.IOnCompleteListener
        {
            public void OnComplete(Android.Gms.Tasks.Task task)
            {
                if (!task.IsSuccessful)
                {
                    Console.WriteLine("Subscription to topic failed");
                }
                else
                {
                    Console.WriteLine("Subscription to topic successful");
                }
            }
        }

        private void HideAllViews()
        {
            textMessage.Visibility = ViewStates.Gone;
            webView.Visibility = ViewStates.Gone;
            listView.Visibility = ViewStates.Gone;
            listViewNot.Visibility = ViewStates.Gone;
            FrameLayout container = FindViewById<FrameLayout>(Resource.Id.fragment_container);
            container.Visibility = ViewStates.Gone;
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);
            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }

        public bool OnNavigationItemSelected(IMenuItem item)
        {
            HideAllViews();

            switch (item.ItemId)
            {
                case Resource.Id.navigation_home:
                    listView.Visibility = ViewStates.Visible;
                    LoadHomePage();
                    break;
                case Resource.Id.navigation_dashboard:
                    FrameLayout container = FindViewById<FrameLayout>(Resource.Id.fragment_container);
                    container.Visibility = ViewStates.Visible;
                    LoadDashboardPage();
                    break;
                case Resource.Id.navigation_notifications:
                    listViewNot.Visibility = ViewStates.Visible;
                    LoadNotificationPage();
                    break;
                default:
                    return false;
            }
            return true;
        }

        public class ArticleAdapter : ArrayAdapter<Article>
        {
            public List<Article> Articles { get; private set; }

            public ArticleAdapter(Activity context, List<Article> articles)
                : base(context, Resource.Layout.list_item_article, articles)
            {
                Articles = articles;
            }

            public override View GetView(int position, View convertView, ViewGroup parent)
            {
                var view = convertView ?? LayoutInflater.From(Context).Inflate(Resource.Layout.list_item_article, parent, false);
                var imageView = view.FindViewById<ImageView>(Resource.Id.articleImageView);
                var titleView = view.FindViewById<TextView>(Resource.Id.articleTitleView);
                var article = Articles[position];

                titleView.Text = article.Title;

                if (!string.IsNullOrEmpty(article.Image))
                {
                    try
                    {
                        Bitmap bitmap = ConvertBase64ToBitmap(article.Image);
                        imageView.SetImageBitmap(bitmap);
                    }
                    catch (Exception ex)
                    {
                        Log.Error("ArticleAdapter", "Error setting image: " + ex.Message);
                    }
                }

                return view;
            }
        }

        private void InitializeDashboardViews(View dashboardView)
        {
            TextView textUsername = dashboardView.FindViewById<TextView>(Resource.Id.textUsername);
            textUsername.Text = $"Username: {username}";

            Button changePasswordButton = dashboardView.FindViewById<Button>(Resource.Id.changePasswordButton);
            EditText currentPasswordInput = dashboardView.FindViewById<EditText>(Resource.Id.currentPasswordInput);
            EditText newPasswordInput = dashboardView.FindViewById<EditText>(Resource.Id.newPasswordInput);
            EditText confirmPasswordInput = dashboardView.FindViewById<EditText>(Resource.Id.confirmPasswordInput);
            Button submitChangePasswordButton = dashboardView.FindViewById<Button>(Resource.Id.submitChangePasswordButton);

            changePasswordButton.Click += (sender, e) =>
            {
                if (currentPasswordInput.Visibility == ViewStates.Visible)
                {
                    currentPasswordInput.Visibility = ViewStates.Gone;
                    newPasswordInput.Visibility = ViewStates.Gone;
                    confirmPasswordInput.Visibility = ViewStates.Gone;
                    submitChangePasswordButton.Visibility = ViewStates.Gone;
                    changePasswordButton.Text = "Change Password";
                }
                else
                {
                    currentPasswordInput.Visibility = ViewStates.Visible;
                    newPasswordInput.Visibility = ViewStates.Visible;
                    confirmPasswordInput.Visibility = ViewStates.Visible;
                    submitChangePasswordButton.Visibility = ViewStates.Visible;
                    changePasswordButton.Text = "Cancel";
                }
            };

            submitChangePasswordButton.Click += async (sender, e) =>
            {
                string currentPassword = currentPasswordInput.Text;
                string newPassword = newPasswordInput.Text;
                string confirmPassword = confirmPasswordInput.Text;

                if (!string.IsNullOrEmpty(newPassword) && newPassword == confirmPassword)
                {
                    bool result = await ApiService.ChangePassword(this, username, currentPassword, newPassword, confirmPassword);
                    if (result)
                    {
                        Toast.MakeText(this, "Password changed successfully.", ToastLength.Short).Show();
                        ResetPasswordFields(currentPasswordInput, newPasswordInput, confirmPasswordInput, submitChangePasswordButton, changePasswordButton);
                    }
                    else
                    {
                        Toast.MakeText(this, "Error changing password. Check your current password.", ToastLength.Short).Show();
                    }
                }
                else
                {
                    Toast.MakeText(this, "Passwords do not match or are empty", ToastLength.Short).Show();
                }
            };

            Button logoutButton = dashboardView.FindViewById<Button>(Resource.Id.logoutButton);
            logoutButton.Click += (sender, e) =>
            {
                var editor = GetSharedPreferences("app_settings", FileCreationMode.Private).Edit();
                editor.Remove("username");
                editor.Apply();

                StartActivity(new Intent(this, typeof(LoginActivity)));
                Finish();
            };
        }

        private void ResetPasswordFields(EditText currentPasswordInput, EditText newPasswordInput, EditText confirmPasswordInput, Button submitChangePasswordButton, Button changePasswordButton)
        {
            currentPasswordInput.Text = "";
            newPasswordInput.Text = "";
            confirmPasswordInput.Text = "";
            currentPasswordInput.Visibility = ViewStates.Gone;
            newPasswordInput.Visibility = ViewStates.Gone;
            confirmPasswordInput.Visibility = ViewStates.Gone;
            submitChangePasswordButton.Visibility = ViewStates.Gone;
            changePasswordButton.Text = "Change Password";
        }

        private async void LoadDashboardPage()
        {
            progressBar.Visibility = ViewStates.Visible;
            try
            {
                FrameLayout container = FindViewById<FrameLayout>(Resource.Id.fragment_container);
                container.RemoveAllViews();
                View dashboardView = LayoutInflater.From(this).Inflate(Resource.Layout.activity_profile, container, false);
                InitializeDashboardViews(dashboardView);
                container.AddView(dashboardView);
            }
            finally
            {
                progressBar.Visibility = ViewStates.Gone;
            }
        }

        private async void LoadHomePage()
        {
            progressBar.Visibility = ViewStates.Visible;
            try
            {
                var companies = await ApiService.FetchCompaniesAsync();

                if (companies == null || !companies.Any())
                {
                    textMessage.Text = "No companies available.";
                    textMessage.Visibility = ViewStates.Visible;
                    listView.Visibility = ViewStates.Gone;
                }
                else
                {
                    CompanyAdapter adapter = new CompanyAdapter(this, companies);
                    listView.Adapter = adapter;
                    listView.ItemClick -= ListView_ItemClick;
                    listView.ItemClick += CompanyListView_ItemClick;
                    textMessage.Visibility = ViewStates.Gone;
                    listView.Visibility = ViewStates.Visible;
                }
            }
            catch (Exception ex)
            {
                Log.Error("MainActivity", "Error loading companies: " + ex.Message);
                textMessage.Text = "Error loading companies: " + ex.Message;
                textMessage.Visibility = ViewStates.Visible;
                listView.Visibility = ViewStates.Gone;
            }
            finally
            {
                progressBar.Visibility = ViewStates.Gone;
            }
        }

        private async void LoadNotificationPage()
        {
            progressBar.Visibility = ViewStates.Visible;
            try
            {
                notifications = await ApiService.FetchNotificationsAsync();
                if (notifications == null || !notifications.Any())
                {
                    textMessage.Text = "No notifications available.";
                    textMessage.Visibility = ViewStates.Visible;
                    listViewNot.Visibility = ViewStates.Gone;
                }
                else
                {
                    notifications.Reverse();
                    NotificationAdapter adapter = new NotificationAdapter(this, notifications);
                    listViewNot.Adapter = adapter;
                    listViewNot.ItemClick -= NotificationListView_ItemClick;
                    listViewNot.ItemClick += NotificationListView_ItemClick;
                    textMessage.Visibility = ViewStates.Gone;
                    listViewNot.Visibility = ViewStates.Visible;
                }
            }
            catch (Exception ex)
            {
                Log.Error("MainActivity", "Error loading notifications: " + ex.Message);
                textMessage.Text = "Error loading notifications: " + ex.Message;
                textMessage.Visibility = ViewStates.Visible;
                listViewNot.Visibility = ViewStates.Gone;
            }
            finally
            {
                progressBar.Visibility = ViewStates.Gone;
            }
        }
        private async void NotificationListView_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            var notification = ((NotificationAdapter)listViewNot.Adapter).Notifications[e.Position];
            notification.IsRead = true;
            var adapter = (NotificationAdapter)listViewNot.Adapter;
            adapter.NotifyDataSetChanged();

            try
            {
                await ApiService.MarkNotificationAsReadAsync(notification.Id); // Asumiendo que tienes un método en ApiService para marcar una notificación como leída
            }
            catch (Exception ex)
            {
                Log.Error("MainActivity", "Error marking notification as read: " + ex.Message);
            }

            if (notification.ArticleId > 0)
            {
                // Directly navigate to the article detail activity
                Task.Run(() => NavigateToArticleDirectly(notification.ArticleId));
            }
        }

        private async Task NavigateToArticleDirectly(int articleId)
        {
            try
            {
                RunOnUiThread(() => progressBar.Visibility = ViewStates.Visible);

                // Fetch the article details directly
                var article = await ApiService.FetchArticleByIdAsync(articleId);
                if (article != null)
                {
                    RunOnUiThread(() =>
                    {
                        Android.Content.Intent intent = new Android.Content.Intent(this, typeof(ArticleDetailActivity));
                        intent.PutExtra("title", article.Title);
                        intent.PutExtra("text", article.Text);
                        intent.PutExtra("imagePath", SaveImageInternalStorage(ConvertBase64ToBitmap(article.Image)));
                        intent.PutExtra("articleId", article.Id);
                        StartActivity(intent);
                    });
                }
                else
                {
                    RunOnUiThread(() => Toast.MakeText(this, "Article not found.", ToastLength.Short).Show());
                }
            }
            catch (Exception ex)
            {
                Log.Error("MainActivity", "Failed to fetch article: " + ex.Message);
                RunOnUiThread(() => Toast.MakeText(this, "An error occurred.", ToastLength.Short).Show());
            }
            finally
            {
                RunOnUiThread(() => progressBar.Visibility = ViewStates.Gone);
            }
        }

        private void ListView_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            try
            {
                var adapter = listView.Adapter as ArticleAdapter;
                if (adapter != null)
                {
                    var article = adapter.Articles[e.Position];
                    Android.Content.Intent intent = new Android.Content.Intent(this, typeof(ArticleDetailActivity));
                    intent.PutExtra("title", article.Title);
                    intent.PutExtra("text", article.Text);
                    intent.PutExtra("imagePath", SaveImageInternalStorage(ConvertBase64ToBitmap(article.Image)));
                    intent.PutExtra("articleId", article.Id);
                    intent.SetFlags(ActivityFlags.ClearTop | ActivityFlags.SingleTop);
                    StartActivity(intent);
                }
                else
                {
                    Toast.MakeText(this, "Error loading article details.", ToastLength.Short).Show();
                }
            }
            catch (Exception ex)
            {
                Log.Error("MainActivity", "Failed to handle item click: " + ex.Message);
                Toast.MakeText(this, "An error occurred.", ToastLength.Short).Show();
            }
        }

        private async void CompanyListView_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            var company = ((CompanyAdapter)listView.Adapter).Companies[e.Position];
            await LoadArticlesForCompany(company.Id);
        }

        private async Task LoadArticlesForCompany(int companyId)
        {
            RunOnUiThread(() => progressBar.Visibility = ViewStates.Visible);

            try
            {
                Log.Info("MainActivity", $"Fetching articles for company ID: {companyId}");
                var articles = await ApiService.FetchArticlesForCompanyAsync(companyId);
                if (articles != null && articles.Any())
                {
                    RunOnUiThread(() =>
                    {
                        articles.Reverse();
                        var adapter = new ArticleAdapter(this, articles);
                        listView.Adapter = adapter;
                        listView.ItemClick -= CompanyListView_ItemClick;
                        listView.ItemClick += ListView_ItemClick;
                        Log.Info("MainActivity", $"Fetched {articles.Count} articles.");
                    });
                }
                else
                {
                    RunOnUiThread(() => Toast.MakeText(this, "No articles found for this company.", ToastLength.Short).Show());
                }
            }
            catch (Exception ex)
            {
                Log.Error("MainActivity", $"Error loading articles: {ex.Message}");
                RunOnUiThread(() => Toast.MakeText(this, "Failed to load articles.", ToastLength.Short).Show());
            }
            finally
            {
                RunOnUiThread(() => progressBar.Visibility = ViewStates.Gone);
            }
        }

        public override void OnBackPressed()
        {
            LoadHomePage();
        }

        private string SaveImageInternalStorage(Bitmap bitmap)
        {
            string fileName = "temp_image.jpg";
            using (var os = OpenFileOutput(fileName, FileCreationMode.Private))
            {
                bitmap.Compress(Bitmap.CompressFormat.Jpeg, 100, os);
            }
            return GetFileStreamPath(fileName).AbsolutePath;
        }

        private static Bitmap ConvertBase64ToBitmap(string base64String)
        {
            if (!string.IsNullOrEmpty(base64String))
            {
                byte[] decodedBytes = Base64.Decode(base64String, Base64Flags.Default);
                return BitmapFactory.DecodeByteArray(decodedBytes, 0, decodedBytes.Length);
            }
            return null;
        }
    }
}
