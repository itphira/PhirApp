using System;
using System.Threading.Tasks;
using UIKit;
using Foundation;
using PhirApp.iOS.Services;
using PhirApp.iOS.Models;

namespace PhirApp.iOS
{
    public class LoginViewController : UIViewController
    {
        UITextField usernameTextField;
        UITextField passwordTextField;
        UIButton loginButton;
        UIActivityIndicatorView progressBar;
        UIButton togglePasswordVisibilityButton;
        bool isPasswordVisible = false;

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();
            View.BackgroundColor = UIColor.White;

            SetupViews();

            // Check if user is already logged in
            var username = NSUserDefaults.StandardUserDefaults.StringForKey("username");
            if (!string.IsNullOrEmpty(username))
            {
                // Start MainViewController if user is already logged in
                NavigateToMainViewController();
            }

            loginButton.TouchUpInside += async (sender, e) => await Login();
            togglePasswordVisibilityButton.TouchUpInside += (sender, e) => TogglePasswordVisibility();
        }

        private void SetupViews()
        {
            usernameTextField = new UITextField
            {
                Placeholder = "Username",
                BorderStyle = UITextBorderStyle.RoundedRect,
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            passwordTextField = new UITextField
            {
                Placeholder = "Password",
                BorderStyle = UITextBorderStyle.RoundedRect,
                SecureTextEntry = true,
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            loginButton = new UIButton(UIButtonType.System)
            {
                TranslatesAutoresizingMaskIntoConstraints = false
            };
            loginButton.SetTitle("Login", UIControlState.Normal);

            progressBar = new UIActivityIndicatorView(UIActivityIndicatorViewStyle.Gray)
            {
                TranslatesAutoresizingMaskIntoConstraints = false,
                HidesWhenStopped = true
            };

            togglePasswordVisibilityButton = new UIButton(UIButtonType.System)
            {
                TranslatesAutoresizingMaskIntoConstraints = false
            };
            togglePasswordVisibilityButton.SetTitle("Show", UIControlState.Normal);

            View.AddSubviews(usernameTextField, passwordTextField, loginButton, progressBar, togglePasswordVisibilityButton);

            // Add constraints for the UI elements
            AddConstraints();
        }

        private void AddConstraints()
        {
            View.AddConstraint(usernameTextField.TopAnchor.ConstraintEqualTo(View.SafeAreaLayoutGuide.TopAnchor, 100));
            View.AddConstraint(usernameTextField.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20));
            View.AddConstraint(usernameTextField.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20));

            View.AddConstraint(passwordTextField.TopAnchor.ConstraintEqualTo(usernameTextField.BottomAnchor, 20));
            View.AddConstraint(passwordTextField.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20));
            View.AddConstraint(passwordTextField.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20));

            View.AddConstraint(loginButton.TopAnchor.ConstraintEqualTo(passwordTextField.BottomAnchor, 20));
            View.AddConstraint(loginButton.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20));
            View.AddConstraint(loginButton.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20));

            View.AddConstraint(progressBar.CenterXAnchor.ConstraintEqualTo(View.CenterXAnchor));
            View.AddConstraint(progressBar.CenterYAnchor.ConstraintEqualTo(View.CenterYAnchor));

            View.AddConstraint(togglePasswordVisibilityButton.TopAnchor.ConstraintEqualTo(passwordTextField.BottomAnchor, 20));
            View.AddConstraint(togglePasswordVisibilityButton.LeadingAnchor.ConstraintEqualTo(passwordTextField.LeadingAnchor));
        }

        private void TogglePasswordVisibility()
        {
            if (isPasswordVisible)
            {
                passwordTextField.SecureTextEntry = true;
                togglePasswordVisibilityButton.SetTitle("Show", UIControlState.Normal);
            }
            else
            {
                passwordTextField.SecureTextEntry = false;
                togglePasswordVisibilityButton.SetTitle("Hide", UIControlState.Normal);
            }
            isPasswordVisible = !isPasswordVisible;
        }

        private async Task Login()
        {
            var username = usernameTextField.Text;
            var password = passwordTextField.Text;

            progressBar.StartAnimating();
            loginButton.Enabled = false;

            if (await IsValidLogin(username, password))
            {
                // Store username in NSUserDefaults
                NSUserDefaults.StandardUserDefaults.SetString(username, "username");

                // Start MainViewController if login is successful
                NavigateToMainViewController();
            }
            else
            {
                var alert = UIAlertController.Create("Login Failed", "Invalid username or password.", UIAlertControllerStyle.Alert);
                alert.AddAction(UIAlertAction.Create("OK", UIAlertActionStyle.Default, null));
                PresentViewController(alert, true, null);
            }

            progressBar.StopAnimating();
            loginButton.Enabled = true;
        }

        private async Task<bool> IsValidLogin(string username, string password)
        {
            try
            {
                var response = await ApiService.GetAsync<LoginResponse>($"api/login?username={Uri.EscapeDataString(username)}&password={Uri.EscapeDataString(password)}");
                return response != null && response.Message == "Login successful";
            }
            catch
            {
                var alert = UIAlertController.Create("Login Failed", "An error occurred while logging in.", UIAlertControllerStyle.Alert);
                alert.AddAction(UIAlertAction.Create("OK", UIAlertActionStyle.Default, null));
                PresentViewController(alert, true, null);
                return false;
            }
        }

        private void NavigateToMainViewController()
        {
            var mainViewController = new MainViewController();
            var navigationController = new UINavigationController(mainViewController);
            PresentViewController(navigationController, true, null);
        }
    }

    public class LoginResponse
    {
        public string Message { get; set; }
    }
}
