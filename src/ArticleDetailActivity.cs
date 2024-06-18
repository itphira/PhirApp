using Android.App;
using Android.Content;
using Android.Graphics;
using Android.OS;
using Android.Util;
using Android.Views;
using Android.Widget;
using AndroidX.AppCompat.App;
using Org.Apache.Http.Authentication;
using Org.W3c.Dom;
using PhirApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MyApiProject.Models;

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
                Finish();
                return;
            }

            SetupViews();

            progressBar.Visibility = ViewStates.Visible;
            try
            {
                List<Comment> comments = await ApiService.FetchComments(articleId);
                AddCommentsToLayout(comments, commentsContainer);
            }
            finally
            {
                progressBar.Visibility = ViewStates.Gone;
            }

            EditText newCommentInput = FindViewById<EditText>(Resource.Id.commentInput);
            Button submitCommentButton = FindViewById<Button>(Resource.Id.submitCommentButton);
            submitCommentButton.Click += async (sender, e) =>
            {
                string newCommentText = newCommentInput.Text;
                if (!string.IsNullOrEmpty(newCommentText))
                {
                    await PostComment(articleId, username, newCommentText, null);
                    newCommentInput.Text = "";
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

            // Ensure articleId is correctly assigned
            if (Intent.HasExtra("articleId"))
            {
                articleId = Intent.GetIntExtra("articleId", -1);
                Log.Info("ArticleDetailActivity", $"Received articleId: {articleId}");
            }
            else
            {
                Log.Error("ArticleDetailActivity", "No articleId received in intent.");
                Finish();
                return;
            }

            titleView.Text = Intent.GetStringExtra("title") ?? "No title";
            textView.Text = Intent.GetStringExtra("text") ?? "No text";

            var imagePath = Intent.GetStringExtra("imagePath");
            if (!string.IsNullOrEmpty(imagePath))
            {
                Bitmap bitmap = BitmapFactory.DecodeFile(imagePath);
                if (bitmap != null)
                {
                    imageView.SetImageBitmap(bitmap);
                }
                else
                {
                    Log.Error("ArticleDetailActivity", "Failed to decode the image.");
                }
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
                repliesContainer.Visibility = ViewStates.Gone;
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

                // Check if the comment is a reply
                if (parentId.HasValue)
                {
                    var parentComment = await ApiService.FetchCommentById(parentId.Value);
                    if (parentComment != null)
                    {
                        var replyNotificationRequest = new ReplyNotificationRequest
                        {
                            Title = "New Reply to Your Comment",
                            ToUsername = parentComment.Author,
                            FromUsername = username,
                            Message = $"{username} replied to your comment."
                        };

                        await ApiService.SendReplyNotification(replyNotificationRequest);
                    }
                }
            }
            catch (Exception ex)
            {
                Toast.MakeText(this, $"Error al publicar comentario: {ex.Message}", ToastLength.Long).Show();
            }
        }
    }
}
