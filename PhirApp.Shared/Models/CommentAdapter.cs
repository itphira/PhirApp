using Android.App;
using Android.Views;
using Android.Widget;
using System.Collections.Generic;

public class CommentAdapter : BaseAdapter<Comment>
{
    private List<Comment> items;
    private Activity context;

    public CommentAdapter(Activity context, List<Comment> items)
    {
        this.context = context;
        this.items = items;
    }

    public override Comment this[int position] => items[position];

    public override int Count => items.Count;

    public override long GetItemId(int position) => position;

    public override View GetView(int position, View convertView, ViewGroup parent)
    {
        var view = convertView ?? context.LayoutInflater.Inflate(Android.Resource.Layout.SimpleListItem2, null);
        var text1 = view.FindViewById<TextView>(Android.Resource.Id.Text1);
        var text2 = view.FindViewById<TextView>(Android.Resource.Id.Text2);

        text1.Text = items[position].Author;
        text2.Text = items[position].CommentText;

        return view;
    }
}
