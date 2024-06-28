using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UIKit;
using Foundation;
using Firebase.CloudMessaging;
using WebKit;
using PhirApp.iOS.Models;
using PhirApp.iOS.Services;
using static SystemConfiguration.NetworkReachability;

namespace PhirApp.iOS
{
    public class MainViewController : UIViewController, IUITableViewDelegate, IUITableViewDataSource, IWKNavigationDelegate
    {
        UILabel textMessage;
        WKWebView webView;
        UITableView articleTableView;
        UITableView notificationTableView;
        UIActivityIndicatorView progressBar;
        string username;
        List<Notification> notifications;
        List<Article> articles;
        enum Page { Home, Dashboard, Notifications }
        Page currentPage;

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();
            View.BackgroundColor = UIColor.White;

            SetupViews();

            // Subscribe to Firebase topics
            Messaging.SharedInstance.Subscribe("articles");
            Messaging.SharedInstance.Subscribe(username);

            LoadHomePage();
        }

        void SetupViews()
        {
            // Setup UI elements
            textMessage = new UILabel
            {
                TranslatesAutoresizingMaskIntoConstraints = false,
                Text = "No data available.",
                Hidden = true
            };

            webView = new WKWebView(View.Frame, new WKWebViewConfiguration())
            {
                TranslatesAutoresizingMaskIntoConstraints = false,
                NavigationDelegate = this,
                Hidden = true
            };

            articleTableView = new UITableView
            {
                TranslatesAutoresizingMaskIntoConstraints = false,
                Hidden = true,
                Delegate = this,
                DataSource = this
            };

            notificationTableView = new UITableView
            {
                TranslatesAutoresizingMaskIntoConstraints = false,
                Hidden = true,
                Delegate = this,
                DataSource = this
            };

            progressBar = new UIActivityIndicatorView(UIActivityIndicatorViewStyle.Gray)
            {
                TranslatesAutoresizingMaskIntoConstraints = false,
                HidesWhenStopped = true
            };

            // Add UI elements to the view
            View.AddSubviews(textMessage, webView, articleTableView, notificationTableView, progressBar);

            // Add constraints for UI elements
            AddConstraints();
        }

        void AddConstraints()
        {
            View.AddConstraint(textMessage.CenterXAnchor.ConstraintEqualTo(View.CenterXAnchor));
            View.AddConstraint(textMessage.CenterYAnchor.ConstraintEqualTo(View.CenterYAnchor));

            View.AddConstraint(webView.TopAnchor.ConstraintEqualTo(View.SafeAreaLayoutGuide.TopAnchor));
            View.AddConstraint(webView.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor));
            View.AddConstraint(webView.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor));
            View.AddConstraint(webView.BottomAnchor.ConstraintEqualTo(View.BottomAnchor));

            View.AddConstraint(articleTableView.TopAnchor.ConstraintEqualTo(View.SafeAreaLayoutGuide.TopAnchor));
            View.AddConstraint(articleTableView.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor));
            View.AddConstraint(articleTableView.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor));
            View.AddConstraint(articleTableView.BottomAnchor.ConstraintEqualTo(View.BottomAnchor));

            View.AddConstraint(notificationTableView.TopAnchor.ConstraintEqualTo(View.SafeAreaLayoutGuide.TopAnchor));
            View.AddConstraint(notificationTableView.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor));
            View.AddConstraint(notificationTableView.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor));
            View.AddConstraint(notificationTableView.BottomAnchor.ConstraintEqualTo(View.BottomAnchor));

            View.AddConstraint(progressBar.CenterXAnchor.ConstraintEqualTo(View.CenterXAnchor));
            View.AddConstraint(progressBar.CenterYAnchor.ConstraintEqualTo(View.CenterYAnchor));
        }

        void HideAllViews()
        {
            textMessage.Hidden = true;
            webView.Hidden = true;
            articleTableView.Hidden = true;
            notificationTableView.Hidden = true;
        }

        async void LoadHomePage()
        {
            HideAllViews();
            articleTableView.Hidden = false;
            progressBar.StartAnimating();

            try
            {
                articles = await ApiService.FetchArticlesAsync();
                articleTableView.ReloadData();
                if (!articles.Any())
                {
                    textMessage.Text = "No articles available.";
                    textMessage.Hidden = false;
                }
            }
            catch (Exception ex)
            {
                textMessage.Text = $"Error loading articles: {ex.Message}";
                textMessage.Hidden = false;
            }
            finally
            {
                progressBar.StopAnimating();
            }
        }

        async void LoadNotificationPage()
        {
            HideAllViews();
            notificationTableView.Hidden = false;
            progressBar.StartAnimating();

            try
            {
                notifications = await ApiService.FetchNotificationsAsync();
                notificationTableView.ReloadData();
                if (!notifications.Any())
                {
                    textMessage.Text = "No notifications available.";
                    textMessage.Hidden = false;
                }
            }
            catch (Exception ex)
            {
                textMessage.Text = $"Error loading notifications: {ex.Message}";
                textMessage.Hidden = false;
            }
            finally
            {
                progressBar.StopAnimating();
            }
        }

        public nint RowsInSection(UITableView tableView, nint section)
        {
            if (tableView == articleTableView)
            {
                return articles?.Count ?? 0;
            }
            else if (tableView == notificationTableView)
            {
                return notifications?.Count ?? 0;
            }
            return 0;
        }

        public UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
        {
            if (tableView == articleTableView)
            {
                var cell = tableView.DequeueReusableCell("ArticleCell") ?? new UITableViewCell(UITableViewCellStyle.Default, "ArticleCell");
                var article = articles[indexPath.Row];
                cell.TextLabel.Text = article.Title;
                return cell;
            }
            else if (tableView == notificationTableView)
            {
                var cell = tableView.DequeueReusableCell("NotificationCell") ?? new UITableViewCell(UITableViewCellStyle.Default, "NotificationCell");
                var notification = notifications[indexPath.Row];
                cell.TextLabel.Text = notification.Title;
                return cell;
            }
            return null;
        }

        public void RowSelected(UITableView tableView, NSIndexPath indexPath)
        {
            if (tableView == articleTableView)
            {
                var article = articles[indexPath.Row];
                var detailViewController = new ArticleDetailViewController
                {
                    Article = article
                };
                NavigationController.PushViewController(detailViewController, true);
            }
            else if (tableView == notificationTableView)
            {
                var notification = notifications[indexPath.Row];
                // Handle notification click
            }
        }
    }

    public class ArticleDetailViewController : UIViewController
    {
        public Article Article { get; set; }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();
            View.BackgroundColor = UIColor.White;

            var titleLabel = new UILabel
            {
                Text = Article.Title,
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            var contentLabel = new UILabel
            {
                Text = Article.Content,
                TranslatesAutoresizingMaskIntoConstraints = false,
                Lines = 0
            };

            var imageView = new UIImageView
            {
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            if (!string.IsNullOrEmpty(Article.ImageUrl))
            {
                var imageData = Convert.FromBase64String(Article.ImageUrl);
                imageView.Image = UIImage.LoadFromData(NSData.FromArray(imageData));
            }

            View.AddSubviews(titleLabel, contentLabel, imageView);

            View.AddConstraint(titleLabel.TopAnchor.ConstraintEqualTo(View.SafeAreaLayoutGuide.TopAnchor, 20));
            View.AddConstraint(titleLabel.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20));
            View.AddConstraint(titleLabel.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20));

            View.AddConstraint(contentLabel.TopAnchor.ConstraintEqualTo(titleLabel.BottomAnchor, 20));
            View.AddConstraint(contentLabel.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20));
            View.AddConstraint(contentLabel.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20));

            View.AddConstraint(imageView.TopAnchor.ConstraintEqualTo(contentLabel.BottomAnchor, 20));
            View.AddConstraint(imageView.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20));
            View.AddConstraint(imageView.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20));
            View.AddConstraint(imageView.HeightAnchor.ConstraintEqualTo(200));
        }
    }
}
