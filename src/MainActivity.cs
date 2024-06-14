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
using System.Threading.Tasks;
using Android.Util;
using Firebase.Messaging;
using Android.Graphics;
using Android.Webkit;
using System.Linq;

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
        private bool displayingCompanies = true;
        private ProgressBar progressBar;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_main);

            // Initialize Firebase messaging
            FirebaseMessaging.Instance.SubscribeToTopic("all").AddOnCompleteListener(new OnCompleteListener());

            // Get username from shared preferences
            ISharedPreferences sharedPreferences = GetSharedPreferences("app_settings", FileCreationMode.Private);
            username = sharedPreferences.GetString("username", null);

            if (string.IsNullOrEmpty(username))
            {
                Toast.MakeText(this, "Por favor, inicia sesión para continuar.", ToastLength.Short).Show();
                Finish();
                return;
            }

            SetupViews();
            LoadHomePage();
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
                        Log.Error("ArticleAdapter", "Error ajuste de imagen: " + ex.Message);
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
                    changePasswordButton.Text = "Cambiar contraseña";
                }
                else
                {
                    currentPasswordInput.Visibility = ViewStates.Visible;
                    newPasswordInput.Visibility = ViewStates.Visible;
                    confirmPasswordInput.Visibility = ViewStates.Visible;
                    submitChangePasswordButton.Visibility = ViewStates.Visible;
                    changePasswordButton.Text = "Cancelar";
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
                        Toast.MakeText(this, "Contraseña cambiada correctamente.", ToastLength.Short).Show();
                        ResetPasswordFields(currentPasswordInput, newPasswordInput, confirmPasswordInput, submitChangePasswordButton, changePasswordButton);
                    }
                    else
                    {
                        Toast.MakeText(this, "Error al cambiar la contraseña. Comprueba tu contraseña actual.", ToastLength.Short).Show();
                    }
                }
                else
                {
                    Toast.MakeText(this, "La contraseñas no coinciden o están vacías", ToastLength.Short).Show();
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
            changePasswordButton.Text = "Cambiar contraseña";
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
                    textMessage.Text = "No hay compañias disponibles.";
                    textMessage.Visibility = ViewStates.Visible;
                    listView.Visibility = ViewStates.Gone;
                }
                else
                {
                    CompanyAdapter adapter = new CompanyAdapter(this, companies);

                    listView.Adapter = adapter;
                    listView.ItemClick -= CompanyListView_ItemClick;
                    listView.ItemClick += CompanyListView_ItemClick;
                    textMessage.Visibility = ViewStates.Gone;
                    listView.Visibility = ViewStates.Visible;
                }
            }
            catch (Exception ex)
            {
                Log.Error("MainActivity", "Error cargando compañias: " + ex.Message);
                textMessage.Text = "Error cargando compañias: " + ex.Message;
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
                var notifications = await ApiService.FetchNotificationsAsync();
                if (notifications == null || !notifications.Any())
                {
                    textMessage.Text = "No hay notificaciones disponibles.";
                    textMessage.Visibility = ViewStates.Visible;
                    listViewNot.Visibility = ViewStates.Gone;
                }
                else
                {
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
                Log.Error("MainActivity", "Error cargando notificaciones: " + ex.Message);
                textMessage.Text = "Error cargando notificaciones: " + ex.Message;
                textMessage.Visibility = ViewStates.Visible;
                listViewNot.Visibility = ViewStates.Gone;
            }
            finally
            {
                progressBar.Visibility = ViewStates.Gone;
            }
        }

        private void NotificationListView_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            var notification = ((NotificationAdapter)listViewNot.Adapter).Notifications[e.Position];
            if (!string.IsNullOrEmpty(notification.Link))
            {
                Intent intent;
                if (notification.Link.StartsWith("http"))
                {
                    intent = new Intent(Intent.ActionView, Android.Net.Uri.Parse(notification.Link));
                }
                else
                {
                    intent = new Intent(this, typeof(ArticleDetailActivity));
                    intent.PutExtra("articleId", int.Parse(notification.Link));
                }
                StartActivity(intent);
            }
        }

        private async void LoadArticlesForCompany(int companyId)
        {
            progressBar.Visibility = ViewStates.Visible;
            try
            {
                var articles = await ApiService.FetchArticlesForCompanyAsync(companyId);
                if (articles.Any())
                {
                    articles.Reverse();
                    ArticleAdapter adapter = new ArticleAdapter(this, articles);
                    listView.Adapter = adapter;
                    listView.ItemClick -= CompanyListView_ItemClick;
                    listView.ItemClick += ListView_ItemClick;
                }
                else
                {
                    RunOnUiThread(() => Toast.MakeText(this, "No articles found for this company.", ToastLength.Short).Show());
                }
            }
            catch (Exception ex)
            {
                Log.Error("MainActivity", "Error loading articles: " + ex.Message);
                RunOnUiThread(() => Toast.MakeText(this, "Failed to load articles.", ToastLength.Short).Show());
            }
            finally
            {
                progressBar.Visibility = ViewStates.Gone;
            }
        }

        private void CompanyListView_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            var company = ((CompanyAdapter)listView.Adapter).Companies[e.Position];
            displayingCompanies = false;
            LoadArticlesForCompany(company.Id);
        }

        private void ListView_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            try
            {
                var adapter = listView.Adapter as ArticleAdapter;
                if (adapter != null)
                {
                    var article = adapter.Articles[e.Position];
                    Intent intent = new Intent(this, typeof(ArticleDetailActivity));
                    intent.PutExtra("title", article.Title);
                    intent.PutExtra("text", article.Text);
                    intent.PutExtra("imagePath", SaveImageInternalStorage(ConvertBase64ToBitmap(article.Image)));
                    intent.PutExtra("articleId", article.Id);
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

        public override void OnBackPressed()
        {
            if (!displayingCompanies)
            {
                LoadHomePage();
                displayingCompanies = true;
            }
            else
            {
                base.OnBackPressed();
            }
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
