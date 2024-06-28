using System.Collections.Generic;
using UIKit;
using Xamarin.Essentials;

public class CompaniesViewController : UIViewController
{
    UITableView tableView;
    List<Company> companies;
    CompanyTableViewSource tableViewSource;

    public override void ViewDidLoad()
    {
        base.ViewDidLoad();
        View.BackgroundColor = UIColor.White;

        tableView = new UITableView(View.Frame)
        {
            AutoresizingMask = UIViewAutoresizing.All,
        };

        companies = new List<Company>(); // Populate this list with your data

        tableViewSource = new CompanyTableViewSource(companies);
        tableView.Source = tableViewSource;

        View.AddSubview(tableView);
    }
}
