using Android.App;
using Android.Content;
using Android.OS;
using Android.Graphics;
using System;
using System.Collections.Generic;
using Firebase.Messaging;
using AndroidX.Core.App;

namespace PhirAPP
{
    [Service]
    [IntentFilter(new[] { "com.google.firebase.MESSAGING_EVENT" })]
    public class MyMessagingService:FirebaseMessagingService
    {
        private readonly string NOTIFICATION_CHANNEL_ID = "com.example.yourapp";
        public override void OnMessageReceived(RemoteMessage message)
        {
            if (!message.Data.GetEnumerator().MoveNext())
            {
                SendNotification(message.GetNotification().Title, message.GetNotification().Body);
            }
            else
            {
                SendNotification(message.Data);
            }
        }

        private void SendNotification(IDictionary<string, string> data)
        {
            string title, body;

            data.TryGetValue("title", out title);
            data.TryGetValue("body", out body);

            SendNotification(title, body);
        }

        private void SendNotification(string title, string body) 
        {
            NotificationManager notificationManager = (NotificationManager)GetSystemService(Context.NotificationService);

            if(Build.VERSION.SdkInt >= Android.OS.BuildVersionCodes.O) 
            {
                NotificationChannel notificationChannel = new NotificationChannel(NOTIFICATION_CHANNEL_ID, "Notification Channel",
                    Android.App.NotificationImportance.Default);

                notificationChannel.Description = "EDMTDev Channel";
                notificationChannel.EnableLights(true);
                notificationChannel.LightColor = Color.Blue;
                notificationChannel.SetVibrationPattern(new long[] { 0, 1000, 500, 1000 });

                notificationManager.CreateNotificationChannel(notificationChannel);
            }

            NotificationCompat.Builder notificationBuilder = new NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID);

            notificationBuilder.SetAutoCancel(true)
                .SetDefaults(-1)
                .SetWhen(DateTimeOffset.UtcNow.ToUnixTimeMilliseconds())
                .SetContentTitle(title)
                .SetContentText(body)
                .SetSmallIcon(Resource.Mipmap.ic_launcher_round)
                .SetContentInfo("info");

            notificationManager.Notify(new Random().Next(), notificationBuilder.Build() );
        }
    }
}