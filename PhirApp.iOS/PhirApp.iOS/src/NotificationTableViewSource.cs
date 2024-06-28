using System;
using System.Collections.Generic;
using UIKit;
using Foundation;
using PhirApp.iOS.Models;
using static SystemConfiguration.NetworkReachability;

namespace PhirApp.iOS
{
    public class NotificationTableViewSource : UITableViewSource
    {
        private readonly List<Notification> notifications;
        private readonly string cellIdentifier = "NotificationCell";

        public NotificationTableViewSource(List<Notification> notifications)
        {
            this.notifications = notifications ?? throw new ArgumentNullException(nameof(notifications));
            Console.WriteLine($"NotificationTableViewSource initialized with {notifications.Count} notifications.");
        }

        public override nint RowsInSection(UITableView tableView, nint section)
        {
            return notifications.Count;
        }

        public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
        {
            var cell = tableView.DequeueReusableCell(cellIdentifier) ?? new UITableViewCell(UITableViewCellStyle.Subtitle, cellIdentifier);
            var notification = notifications[indexPath.Row];

            cell.TextLabel.Text = notification.Title;
            cell.DetailTextLabel.Text = notification.Text;

            return cell;
        }

        public Notification GetNotification(int row)
        {
            return notifications[row];
        }
    }
}
