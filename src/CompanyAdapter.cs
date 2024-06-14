using Android.Content;
using Android.Graphics;
using Android.Util;
using Android.Views;
using Android.Widget;
using System;
using System.Collections.Generic;

namespace PhirAPP
{
    public class CompanyAdapter : ArrayAdapter<Company>
    {
        public List<Company> Companies { get; private set; }

        public CompanyAdapter(Context context, List<Company> companies)
            : base(context, 0, companies)
        {
            Companies = companies ?? throw new ArgumentNullException(nameof(companies));
            Log.Debug("CompanyAdapter", $"Adapter initialized with {Companies.Count} companies.");
        }

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            try
            {
                if (convertView == null)
                {
                    convertView = LayoutInflater.From(Context).Inflate(Resource.Layout.list_item_company, parent, false);
                }

                var imageView = convertView.FindViewById<ImageView>(Resource.Id.companyImageView);
                var titleView = convertView.FindViewById<TextView>(Resource.Id.companyTitleView);

                var company = Companies[position];
                titleView.Text = company.Title;

                if (company.Image != null)
                {
                    Bitmap bitmap = BitmapFactory.DecodeByteArray(company.Image, 0, company.Image.Length);
                    imageView.SetImageBitmap(bitmap);
                }

                return convertView;
            }
            catch (Exception ex)
            {
                Log.Error("CompanyAdapter", $"Error in GetView: {ex.Message}");
                throw;
            }
        }
    }
}
