using Android.App;
using Android.Content;
using Android.Graphics;
using Android.OS;
using Android.Views;
using Android.Widget;
using AndroidX.AppCompat.App;
using PhirApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PhirAPP
{
    [Activity(Label = "Article Detail")]
    public class ArticleDetailActivity : AppCompatActivity
    {
        private int articleId;
        private string username;
        private LinearLayout commentsContainer;
        private ProgressBar progressBar;

        protected override async void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_article_detail);

            ISharedPreferences sharedPreferences = GetSharedPreferences("app_settings", FileCreationMode.Private);
            username = sharedPreferences.GetString("username", null);
            if (string.IsNullOrEmpty(username))
            {
                Finish(); // Exit if no username
                return;
            }

            SetupViews();

            // Show progress bar
            progressBar.Visibility = ViewStates.Visible;
            try
            {
                List<Comment> comments = await ApiService.FetchComments(articleId);
                AddCommentsToLayout(comments, commentsContainer);
            }
            finally
            {
                // Hide progress bar
                progressBar.Visibility = ViewStates.Gone;
            }

            // Setup for posting a new comment
            EditText newCommentInput = FindViewById<EditText>(Resource.Id.commentInput);
            Button submitCommentButton = FindViewById<Button>(Resource.Id.submitCommentButton);
            submitCommentButton.Click += async (sender, e) =>
            {
                string newCommentText = newCommentInput.Text;
                if (!string.IsNullOrEmpty(newCommentText))
                {
                    await PostComment(articleId, username, newCommentText, null);
                    newCommentInput.Text = ""; // Clear the input field
                    List<Comment> comments = await ApiService.FetchComments(articleId);
                    AddCommentsToLayout(comments, commentsContainer);
                }
            };
        }

        private void SetupViews()
        {
            TextView titleView = FindViewById<TextView>(Resource.Id.articleTitleView);
            TextView textView = FindViewById<TextView>(Resource.Id.textTextView);
            ImageView imageView = FindViewById<ImageView>(Resource.Id.articleImageView);
            commentsContainer = FindViewById<LinearLayout>(Resource.Id.commentsContainer);
            progressBar = FindViewById<ProgressBar>(Resource.Id.articleProgressBar);

            titleView.Text = Intent.GetStringExtra("title");
            textView.Text = Intent.GetStringExtra("text");
            articleId = Intent.GetIntExtra("articleId", 0);

            if (!string.IsNullOrEmpty(Intent.GetStringExtra("imagePath")))
            {
                Bitmap bitmap = BitmapFactory.DecodeFile(Intent.GetStringExtra("imagePath"));
                imageView.SetImageBitmap(bitmap);
            }

            ImageButton backButton = FindViewById<ImageButton>(Resource.Id.backButton);
            backButton.Click += (sender, e) => Finish();
        }

        private void AddCommentsToLayout(List<Comment> allComments, LinearLayout container)
        {
            container.RemoveAllViews();

            var topLevelComments = allComments.Where(c => c.ParentId == null).ToList();
            foreach (var comment in topLevelComments)
            {
                View commentView = AddCommentView(comment, container, false);
                container.AddView(commentView);

                LinearLayout repliesContainer = new LinearLayout(this)
                {
                    Orientation = Orientation.Vertical,
                    LayoutParameters = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MatchParent, ViewGroup.LayoutParams.WrapContent)
                };
                repliesContainer.SetPadding(30, 0, 0, 0);
                repliesContainer.Visibility = ViewStates.Gone;  // Initially hide replies
                container.AddView(repliesContainer);

                AddAllReplies(comment.CommentId, allComments, repliesContainer);
                SetupShowRepliesText(comment, repliesContainer, commentView);
            }
        }

        private void AddAllReplies(int parentId, List<Comment> allComments, LinearLayout repliesContainer)
        {
            var replies = allComments.Where(c => c.ParentId == parentId).ToList();
            foreach (var reply in replies)
            {
                View replyView = AddCommentView(reply, repliesContainer, true);
                repliesContainer.AddView(replyView);

                // Recursive call to add replies at the same level, under the parent's container
                AddAllReplies(reply.CommentId, allComments, repliesContainer);
            }
        }

        private View AddCommentView(Comment comment, ViewGroup parent, bool isReply)
        {
            View commentView = LayoutInflater.From(this).Inflate(Resource.Layout.comment_item, parent, false);
            TextView textView = commentView.FindViewById<TextView>(Resource.Id.commentTextView);
            textView.Text = $"{comment.Author}: {comment.CommentText}";
            ImageButton deleteButton = commentView.FindViewById<ImageButton>(Resource.Id.deleteCommentButton);

            if (isReply)
            {
                LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MatchParent, ViewGroup.LayoutParams.WrapContent);
                layoutParams.SetMargins(20, 0, 0, 0);
                commentView.LayoutParameters = layoutParams;
            }

            if (comment.Author == username)
            {
                deleteButton.Visibility = ViewStates.Visible;
                deleteButton.Click += async (sender, e) =>
                {
                    await DeleteComment(comment.CommentId);
                    List<Comment> updatedComments = await ApiService.FetchComments(articleId);
                    AddCommentsToLayout(updatedComments, commentsContainer);
                };
            }
            else
            {
                deleteButton.Visibility = ViewStates.Gone;
            }

            SetupReplyFunctionality(comment, commentView);
            return commentView;
        }

        private async Task DeleteComment(int commentId)
        {
            bool result = await ApiService.DeleteComment(commentId);
            if (result)
            {
                Toast.MakeText(this, "Comentario borrado correctamente", ToastLength.Short).Show();
                // Refresh the comment list
                List<Comment> updatedComments = await ApiService.FetchComments(articleId);
                AddCommentsToLayout(updatedComments, commentsContainer);
            }
            else
            {
                Toast.MakeText(this, "Error al borrar el comentario", ToastLength.Short).Show();
            }
        }

        private void SetupShowRepliesText(Comment comment, LinearLayout repliesContainer, View commentView)
        {
            TextView showRepliesText = commentView.FindViewById<TextView>(Resource.Id.showRepliesText);

            // Only show the "Ver respuestas" text if there are actually replies in the repliesContainer
            if (repliesContainer.ChildCount > 0)
            {
                showRepliesText.Visibility = ViewStates.Visible;
                showRepliesText.Text = "Ver respuestas";
                showRepliesText.Click += (sender, e) =>
                {
                    if (repliesContainer.Visibility == ViewStates.Gone)
                    {
                        repliesContainer.Visibility = ViewStates.Visible;
                        showRepliesText.Text = "Ocultar respuestas";
                    }
                    else
                    {
                        repliesContainer.Visibility = ViewStates.Gone;
                        showRepliesText.Text = "Ver respuestas";
                    }
                };
            }
            else
            {
                // Hide the "Ver respuestas" text if there are no replies
                showRepliesText.Visibility = ViewStates.Gone;
            }
        }

        private void SetupReplyFunctionality(Comment comment, View commentView)
        {
            Button replyButton = commentView.FindViewById<Button>(Resource.Id.replyButton);
            EditText replyInput = commentView.FindViewById<EditText>(Resource.Id.replyInput);
            Button postReplyButton = commentView.FindViewById<Button>(Resource.Id.postReplyButton);

            replyButton.Click += (sender, e) =>
            {
                replyInput.Visibility = ViewStates.Visible;
                postReplyButton.Visibility = ViewStates.Visible;
                replyButton.Visibility = ViewStates.Gone;
                replyInput.Text = $"@{comment.Author} ";
                replyInput.RequestFocus();
            };

            postReplyButton.Click += async (sender, e) =>
            {
                string replyText = replyInput.Text;
                if (!string.IsNullOrEmpty(replyText))
                {
                    await PostComment(articleId, username, replyText, comment.CommentId);
                    replyInput.Text = "";
                    replyInput.Visibility = ViewStates.Gone;
                    postReplyButton.Visibility = ViewStates.Gone;
                    replyButton.Visibility = ViewStates.Visible;

                    List<Comment> updatedComments = await ApiService.FetchComments(articleId);
                    AddCommentsToLayout(updatedComments, commentsContainer);
                }
            };
        }

        private async Task PostComment(int articleId, string username, string commentText, int? parentId = null)
        {
            var newComment = new Comment
            {
                ArticleId = articleId,
                Author = username,
                CommentText = commentText,
                ParentId = parentId,
                PostedDate = DateTime.UtcNow
            };

            try
            {
                await ApiService.PostCommentForArticle(articleId, newComment);
                List<Comment> updatedComments = await ApiService.FetchComments(articleId);
                AddCommentsToLayout(updatedComments, commentsContainer);
            }
            catch (Exception ex)
            {
                Toast.MakeText(this, $"Error al publicar comentario: {ex.Message}", ToastLength.Long).Show();
            }
        }
    }
}
