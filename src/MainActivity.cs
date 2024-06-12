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
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Android.Graphics;
using Android.Util;
using Android.Webkit;
using System.Linq;
using Firebase;
using Android.Gms.Common;
using Firebase.Iid;
using Newtonsoft.Json;
using Firebase.Messaging;

namespace PhirAPP
{
    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme")]
    public class MainActivity : AppCompatActivity, BottomNavigationView.IOnNavigationItemSelectedListener
    {
        TextView textMessage;
        WebView webView;
        ListView listView;
        private string username;
        private bool displayingCompanies = true;
        private ProgressBar progressBar;
        private TextView msgText;
        private Button testNotificationButton;

        private string firebaseServerKey = "AIzaSyAuFyNPHSoab6ibC_fqQegdOHgqdfnDHJ4";
        private string senderId = "1038552327464";

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            SetContentView(Resource.Layout.activity_main);

            FirebaseMessaging.Instance.SubscribeToTopic("all")
            .AddOnCompleteListener(new OnCompleteListener());

            ISharedPreferences sharedPreferences = GetSharedPreferences("app_settings", FileCreationMode.Private);
            username = sharedPreferences.GetString("username", null);

            if (string.IsNullOrEmpty(username))
            {
                Toast.MakeText(this, "Porfavor, inicia sesión para continuar.", ToastLength.Short).Show();
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
            BottomNavigationView navigation = FindViewById<BottomNavigationView>(Resource.Id.navigation);
            progressBar = FindViewById<ProgressBar>(Resource.Id.progressBar);
            testNotificationButton = FindViewById<Button>(Resource.Id.testNotificationButton);
            navigation.SetOnNavigationItemSelectedListener(this);

            testNotificationButton.Click += async (sender, e) =>
            {
                await SendTestNotification();
            };
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

        private async Task SendTestNotification()
        {
            using (var client = new HttpClient())
            {
                var message = new
                {
                    to = "/topics/all", // or a specific token
                    notification = new
                    {
                        title = "Test Notification",
                        body = "This is a test notification from the app."
                    }
                };

                var jsonMessage = JsonConvert.SerializeObject(message);
                var content = new StringContent(jsonMessage, Encoding.UTF8, "application/json");

                client.DefaultRequestHeaders.TryAddWithoutValidation("Authorization", $"key={firebaseServerKey}");
                client.DefaultRequestHeaders.TryAddWithoutValidation("Sender", $"id={senderId}");

                var response = await client.PostAsync("https://fcm.googleapis.com/fcm/send", content);

                if (response.IsSuccessStatusCode)
                {
                    Toast.MakeText(this, "Notification sent successfully!", ToastLength.Short).Show();
                }
                else
                {
                    string responseContent = await response.Content.ReadAsStringAsync();
                    Toast.MakeText(this, $"Failed to send notification: {response.StatusCode}", ToastLength.Short).Show();
                }
            }
        }
        private void HideAllViews()
        {
            textMessage.Visibility = ViewStates.Gone;
            webView.Visibility = ViewStates.Gone;
            listView.Visibility = ViewStates.Gone;
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
                    textMessage.Text = "Notificaciones";
                    textMessage.Visibility = ViewStates.Visible;
                    break;
                default:
                    return false;
            }
            return true;
        }

        public class CompanyAdapter : ArrayAdapter<Company>
        {
            public List<Company> Companies { get; private set; }

            public CompanyAdapter(Context context, List<Company> companies)
                : base(context, 0, companies)
            {
                Companies = companies;
            }

            public override View GetView(int position, View convertView, ViewGroup parent)
            {
                if (convertView == null)
                {
                    convertView = LayoutInflater.From(Context).Inflate(Resource.Layout.list_item_company, parent, false);
                }

                var imageView = convertView.FindViewById<ImageView>(Resource.Id.companyImageView);
                var titleView = convertView.FindViewById<TextView>(Resource.Id.companyTitleView);

                var company = Companies[position];
                titleView.Text = company.Title;

                if (company.Image != null) // Assuming Image is a byte array
                {
                    Bitmap bitmap = BitmapFactory.DecodeByteArray(company.Image, 0, company.Image.Length);
                    imageView.SetImageBitmap(bitmap);
                }

                return convertView;
            }
        }

        public class ArticleAdapter : ArrayAdapter<Article>
        {
            public List<Article> Articles { get; private set; } // Expose the list for external access

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
                    // Hide password fields and change button text to "Cambiar contraseña"
                    currentPasswordInput.Visibility = ViewStates.Gone;
                    newPasswordInput.Visibility = ViewStates.Gone;
                    confirmPasswordInput.Visibility = ViewStates.Gone;
                    submitChangePasswordButton.Visibility = ViewStates.Gone;
                    changePasswordButton.Text = "Cambiar contraseña";
                }
                else
                {
                    // Show password fields and change button text to "Cancelar"
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
                // Clear login state
                var editor = GetSharedPreferences("app_settings", FileCreationMode.Private).Edit();
                editor.Remove("username");
                editor.Apply();

                // Redirect to login activity
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
            // Show progress bar
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
                // Hide progress bar
                progressBar.Visibility = ViewStates.Gone;
            }
        }

        private async void LoadHomePage()
        {
            // Show progress bar
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
                    listView.ItemClick -= ListView_ItemClick;
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
                // Hide progress bar
                progressBar.Visibility = ViewStates.Gone;
            }
        }

        private async void LoadArticlesForCompany(int companyId)
        {
            // Show progress bar
            progressBar.Visibility = ViewStates.Visible;
            try
            {
                var articles = await ApiService.FetchArticlesForCompanyAsync(companyId);
                if (articles.Any())
                {
                    articles.Reverse(); // Assuming newer articles should appear first
                    ArticleAdapter adapter = new ArticleAdapter(this, articles);
                    listView.Adapter = adapter;
                    // Make sure to set the correct item click listener for articles
                    listView.ItemClick -= CompanyListView_ItemClick; // Remove company click listener
                    listView.ItemClick += ListView_ItemClick; // Ensure this is set for articles
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
                // Hide progress bar
                progressBar.Visibility = ViewStates.Gone;
            }
        }

        private void CompanyListView_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            var company = ((CompanyAdapter)listView.Adapter).Companies[e.Position];
            displayingCompanies = false; // Now we are going to display articles, so update the flag
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
                    Android.Content.Intent intent = new Android.Content.Intent(this, typeof(ArticleDetailActivity));
                    intent.PutExtra("title", article.Title);
                    intent.PutExtra("text", article.Text);
                    intent.PutExtra("imagePath", SaveImageInternalStorage(ConvertBase64ToBitmap(article.Image)));
                    intent.PutExtra("articleId", article.Id);  // Ensure ID is converted to string if it's not already
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
                // If displaying articles, load companies list instead of going back to login
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
