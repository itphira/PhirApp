using System;
using Foundation;
using UIKit;
using Firebase.CloudMessaging;
using UserNotifications;
using Firebase.Core;

namespace PhirApp.iOS
{
    [Register("AppDelegate")]
    public class AppDelegate : UIApplicationDelegate, IUNUserNotificationCenterDelegate, IMessagingDelegate
    {
        public override UIWindow Window { get; set; }

        public override bool FinishedLaunching(UIApplication application, NSDictionary launchOptions)
        {
            // Initialize Firebase
            App.Configure();

            // Set up Firebase Cloud Messaging
            Messaging.SharedInstance.Delegate = this;

            // Register for remote notifications
            if (UIDevice.CurrentDevice.CheckSystemVersion(10, 0))
            {
                // For iOS 10 display notification (sent via APNS)
                UNUserNotificationCenter.Current.Delegate = this;

                var authOptions = UNAuthorizationOptions.Alert | UNAuthorizationOptions.Badge | UNAuthorizationOptions.Sound;
                UNUserNotificationCenter.Current.RequestAuthorization(authOptions, (granted, error) =>
                {
                    Console.WriteLine(granted);
                });
            }
            else
            {
                var settings = UIUserNotificationSettings.GetSettingsForTypes(UIUserNotificationType.Alert | UIUserNotificationType.Badge | UIUserNotificationType.Sound, null);
                UIApplication.SharedApplication.RegisterUserNotificationSettings(settings);
            }

            UIApplication.SharedApplication.RegisterForRemoteNotifications();

            return true;
        }

        public override void RegisteredForRemoteNotifications(UIApplication application, NSData deviceToken)
        {
            Messaging.SharedInstance.ApnsToken = deviceToken;
        }

        [Export("messaging:didReceiveRegistrationToken:")]
        public void DidReceiveRegistrationToken(Messaging messaging, string fcmToken)
        {
            Console.WriteLine($"FCM token: {fcmToken}");
            SendTokenToServer(fcmToken);
        }

        private void SendTokenToServer(string token)
        {
            // Implement your logic to send the token to your server
            Console.WriteLine($"Token sent to server: {token}");
        }

        // Handle incoming notifications
        public void DidReceiveNotificationResponse(UNUserNotificationCenter center, UNNotificationResponse response, Action completionHandler)
        {
            var userInfo = response.Notification.Request.Content.UserInfo;
            // Handle the notification
            Console.WriteLine(userInfo);
            completionHandler();
        }

        // Called when a notification is delivered to a foreground app.
        [Export("userNotificationCenter:willPresentNotification:withCompletionHandler:")]
        public void WillPresentNotification(UNUserNotificationCenter center, UNNotification notification, Action<UNNotificationPresentationOptions> completionHandler)
        {
            completionHandler(UNNotificationPresentationOptions.Alert | UNNotificationPresentationOptions.Sound);
        }

        [Export("application:didReceiveRemoteNotification:fetchCompletionHandler:")]
        public override void DidReceiveRemoteNotification(UIApplication application, NSDictionary userInfo, Action<UIBackgroundFetchResult> completionHandler)
        {
            Console.WriteLine("Received a remote notification");
            if (userInfo != null)
            {
                var aps = userInfo.ObjectForKey(new NSString("aps")) as NSDictionary;
                var alert = aps["alert"] as NSDictionary;
                var title = alert["title"].ToString();
                var body = alert["body"].ToString();

                SendNotification(title, body);
            }
            completionHandler(UIBackgroundFetchResult.NewData);
        }

        private void SendNotification(string title, string body)
        {
            var content = new UNMutableNotificationContent()
            {
                Title = title,
                Body = body,
                Sound = UNNotificationSound.Default
            };

            var request = UNNotificationRequest.FromIdentifier(Guid.NewGuid().ToString(), content, null);
            UNUserNotificationCenter.Current.AddNotificationRequest(request, (err) =>
            {
                if (err != null)
                {
                    Console.WriteLine($"Error: {err}");
                }
            });
        }
    }
}
