using Android.App;
using Android.Content;
using Android.OS;
using Android.Widget;
using AndroidX.AppCompat.App;
using System.Threading.Tasks;
using PhirApp.Services;
using Android.Views.InputMethods;
using System;
using Android;
using Android.Content.PM;


namespace PhirAPP
{
    [Activity(MainLauncher = true, Theme = "@style/AppTheme")]
    public class LoginActivity : AppCompatActivity
    {
        EditText usernameEditText;
        EditText passwordEditText;
        Button loginButton;
        ProgressBar progressBar;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            const int requestLocationId = 0;

            string[] notiPermission =
            {
                Manifest.Permission.PostNotifications
            };

            if ((int)Build.VERSION.SdkInt < 33) return;

            if (this.CheckSelfPermission(Manifest.Permission.PostNotifications) != Permission.Granted)
            {
                this.RequestPermissions(notiPermission, requestLocationId);
            }
            SetContentView(Resource.Layout.login_activity);

            // Check if user is already logged in
            ISharedPreferences sharedPreferences = GetSharedPreferences("app_settings", FileCreationMode.Private);
            string username = sharedPreferences.GetString("username", null);
            if (!string.IsNullOrEmpty(username))
            {
                // Start MainActivity if user is already logged in
                StartActivity(new Intent(this, typeof(MainActivity)));
                Finish();
                return;
            }

            usernameEditText = FindViewById<EditText>(Resource.Id.usernameEditText);
            passwordEditText = FindViewById<EditText>(Resource.Id.passwordEditText);
            loginButton = FindViewById<Button>(Resource.Id.loginButton);
            progressBar = FindViewById<ProgressBar>(Resource.Id.progressBar);

            usernameEditText.EditorAction += (sender, e) =>
            {
                if (e.ActionId == ImeAction.Next)
                {
                    passwordEditText.RequestFocus();
                    e.Handled = true;
                }
            };

            passwordEditText.EditorAction += async (sender, e) =>
            {
                if (e.ActionId == ImeAction.Done)
                {
                    await Login();
                    e.Handled = true;
                }
            };

            loginButton.Click += async (sender, e) =>
            {
                await Login();
            };
        }

        private async Task Login()
        {
            var username = usernameEditText.Text;
            var password = passwordEditText.Text;

            progressBar.Visibility = Android.Views.ViewStates.Visible;
            loginButton.Enabled = false;

            if (await IsValidLogin(username, password))
            {
                // Store username in shared preferences
                var editor = GetSharedPreferences("app_settings", FileCreationMode.Private).Edit();
                editor.PutString("username", username);
                editor.Apply();

                // Start MainActivity if login is successful
                StartActivity(new Intent(this, typeof(MainActivity)));
                Finish();
            }
            else
            {  
            }

            progressBar.Visibility = Android.Views.ViewStates.Gone;
            loginButton.Enabled = true;
        }

        private async Task<bool> IsValidLogin(string username, string password)
        {
            try
            {
                var response = await ApiService.GetAsync<LoginResponse>($"api/login?username={Uri.EscapeDataString(username)}&password={Uri.EscapeDataString(password)}");
                if (response != null && response.Message == "Login successful")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                Toast.MakeText(this, "Error en inicio de sesión", ToastLength.Short).Show();
                return false;
            }
        }
    }

    public class LoginResponse
    {
        public string Message { get; set; }
    }
}
