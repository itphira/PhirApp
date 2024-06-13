using Android.Content;
using Android.Views;
using Android.Widget;
using System.Collections.Generic;

namespace PhirAPP
{
    public class NotificationAdapter : ArrayAdapter<Notification>
    {
        public List<Notification> Notifications { get; private set; }

        public NotificationAdapter(Context context, List<Notification> notifications)
            : base(context, 0, notifications)
        {
            Notifications = notifications;
        }

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            if (convertView == null)
            {
                convertView = LayoutInflater.From(Context).Inflate(Resource.Layout.activity_notification, parent, false);
            }

            var titleView = convertView.FindViewById<TextView>(Resource.Id.notificationTitleView);
            var textView = convertView.FindViewById<TextView>(Resource.Id.notificationTextView);

            var notification = Notifications[position];
            titleView.Text = notification.Title;
            textView.Text = notification.Text;

            return convertView;
        }
    }
}
