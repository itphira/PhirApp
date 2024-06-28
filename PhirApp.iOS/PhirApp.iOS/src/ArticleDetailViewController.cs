using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UIKit;
using Foundation;
using CoreGraphics;
using PhirApp.iOS.Models;
using PhirApp.iOS.Services;

namespace PhirApp.iOS
{
    public class ArticleDetailViewController : UIViewController
    {
        private int articleId;
        private string username;
        private UIStackView commentsContainer;
        private UIActivityIndicatorView progressBar;
        private UITextField newCommentInput;
        private UIButton submitCommentButton;

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();
            View.BackgroundColor = UIColor.White;

            // Get username from NSUserDefaults
            username = NSUserDefaults.StandardUserDefaults.StringForKey("username");
            if (string.IsNullOrEmpty(username))
            {
                NavigationController.PopViewController(true);
                return;
            }

            SetupViews();

            progressBar.StartAnimating();
            LoadCommentsAsync();
        }

        private void SetupViews()
        {
            var titleLabel = new UILabel
            {
                Text = NavigationItem.Title,
                Font = UIFont.BoldSystemFontOfSize(24),
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            var textView = new UITextView
            {
                Text = NavigationItem.Prompt,
                Editable = false,
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            var imageView = new UIImageView
            {
                ContentMode = UIViewContentMode.ScaleAspectFit,
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            if (NavigationItem.BackBarButtonItem != null && !string.IsNullOrEmpty(NavigationItem.BackBarButtonItem.Title))
            {
                var imageData = Convert.FromBase64String(NavigationItem.BackBarButtonItem.Title);
                imageView.Image = UIImage.LoadFromData(NSData.FromArray(imageData));
            }

            commentsContainer = new UIStackView
            {
                Axis = UILayoutConstraintAxis.Vertical,
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            progressBar = new UIActivityIndicatorView(UIActivityIndicatorViewStyle.Gray)
            {
                TranslatesAutoresizingMaskIntoConstraints = false,
                HidesWhenStopped = true
            };

            newCommentInput = new UITextField
            {
                Placeholder = "Write a comment...",
                BorderStyle = UITextBorderStyle.RoundedRect,
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            submitCommentButton = new UIButton(UIButtonType.System)
            {
                TranslatesAutoresizingMaskIntoConstraints = false
            };
            submitCommentButton.SetTitle("Post Comment", UIControlState.Normal);
            submitCommentButton.TouchUpInside += async (sender, e) => await PostCommentAsync();

            View.AddSubviews(titleLabel, textView, imageView, commentsContainer, progressBar, newCommentInput, submitCommentButton);

            AddConstraints(titleLabel, textView, imageView, newCommentInput, submitCommentButton);
        }

        private void AddConstraints(UILabel titleLabel, UITextView textView, UIImageView imageView, UITextField newCommentInput, UIButton submitCommentButton)
        {
            View.AddConstraints(new[]
            {
                titleLabel.TopAnchor.ConstraintEqualTo(View.SafeAreaLayoutGuide.TopAnchor, 20),
                titleLabel.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20),
                titleLabel.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20),

                textView.TopAnchor.ConstraintEqualTo(titleLabel.BottomAnchor, 20),
                textView.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20),
                textView.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20),

                imageView.TopAnchor.ConstraintEqualTo(textView.BottomAnchor, 20),
                imageView.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20),
                imageView.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20),
                imageView.HeightAnchor.ConstraintEqualTo(200),

                commentsContainer.TopAnchor.ConstraintEqualTo(imageView.BottomAnchor, 20),
                commentsContainer.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20),
                commentsContainer.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20),

                newCommentInput.TopAnchor.ConstraintEqualTo(commentsContainer.BottomAnchor, 20),
                newCommentInput.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20),
                newCommentInput.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20),

                submitCommentButton.TopAnchor.ConstraintEqualTo(newCommentInput.BottomAnchor, 20),
                submitCommentButton.LeadingAnchor.ConstraintEqualTo(View.LeadingAnchor, 20),
                submitCommentButton.TrailingAnchor.ConstraintEqualTo(View.TrailingAnchor, -20)
            });
        }

        private async void LoadCommentsAsync()
        {
            try
            {
                var comments = await ApiService.FetchComments(articleId);
                AddCommentsToView(comments);
            }
            finally
            {
                progressBar.StopAnimating();
            }
        }

        private void AddCommentsToView(List<Comment> comments)
        {
            commentsContainer.ArrangedSubviews.ToList().ForEach(view => view.RemoveFromSuperview());

            var topLevelComments = comments.Where(c => c.ParentId == null).ToList();
            foreach (var comment in topLevelComments)
            {
                var commentView = CreateCommentView(comment, false);
                commentsContainer.AddArrangedSubview(commentView);

                var repliesContainer = new UIStackView
                {
                    Axis = UILayoutConstraintAxis.Vertical,
                    Spacing = 5,
                    TranslatesAutoresizingMaskIntoConstraints = false,
                    Hidden = true
                };

                AddReplies(comment.CommentId, comments, repliesContainer);
                commentsContainer.AddArrangedSubview(repliesContainer);

                var showRepliesButton = CreateShowRepliesButton(repliesContainer);
                commentView.AddSubview(showRepliesButton);
            }
        }

        private void AddReplies(int parentId, List<Comment> comments, UIStackView repliesContainer)
        {
            var replies = comments.Where(c => c.ParentId == parentId).ToList();
            foreach (var reply in replies)
            {
                var replyView = CreateCommentView(reply, true);
                repliesContainer.AddArrangedSubview(replyView);
                AddReplies(reply.CommentId, comments, repliesContainer);
            }
        }

        private UIView CreateCommentView(Comment comment, bool isReply)
        {
            var containerView = new UIView
            {
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            var commentLabel = new UILabel
            {
                Text = $"{comment.Author}: {comment.CommentText}",
                Lines = 0,
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            containerView.AddSubview(commentLabel);
            containerView.AddConstraints(new[]
            {
                commentLabel.TopAnchor.ConstraintEqualTo(containerView.TopAnchor),
                commentLabel.LeadingAnchor.ConstraintEqualTo(containerView.LeadingAnchor, isReply ? 20 : 0),
                commentLabel.TrailingAnchor.ConstraintEqualTo(containerView.TrailingAnchor),
                commentLabel.BottomAnchor.ConstraintEqualTo(containerView.BottomAnchor)
            });

            if (comment.Author == username)
            {
                var deleteButton = new UIButton(UIButtonType.System)
                {
                    TranslatesAutoresizingMaskIntoConstraints = false
                };
                deleteButton.SetTitle("Delete", UIControlState.Normal);
                deleteButton.TouchUpInside += async (sender, e) => await DeleteCommentAsync(comment.CommentId);

                containerView.AddSubview(deleteButton);
                containerView.AddConstraints(new[]
                {
                    deleteButton.TopAnchor.ConstraintEqualTo(containerView.TopAnchor),
                    deleteButton.TrailingAnchor.ConstraintEqualTo(containerView.TrailingAnchor),
                    deleteButton.BottomAnchor.ConstraintEqualTo(containerView.BottomAnchor)
                });
            }

            var replyButton = new UIButton(UIButtonType.System)
            {
                TranslatesAutoresizingMaskIntoConstraints = false
            };
            replyButton.SetTitle("Reply", UIControlState.Normal);
            replyButton.TouchUpInside += (sender, e) => ShowReplyInput(comment.CommentId);

            containerView.AddSubview(replyButton);
            containerView.AddConstraints(new[]
            {
                replyButton.TopAnchor.ConstraintEqualTo(containerView.TopAnchor),
                replyButton.TrailingAnchor.ConstraintEqualTo(containerView.TrailingAnchor),
                replyButton.BottomAnchor.ConstraintEqualTo(containerView.BottomAnchor)
            });

            return containerView;
        }

        private UIButton CreateShowRepliesButton(UIStackView repliesContainer)
        {
            var showRepliesButton = new UIButton(UIButtonType.System)
            {
                TranslatesAutoresizingMaskIntoConstraints = false
            };
            showRepliesButton.SetTitle("Show Replies", UIControlState.Normal);
            showRepliesButton.TouchUpInside += (sender, e) =>
            {
                repliesContainer.Hidden = !repliesContainer.Hidden;
                showRepliesButton.SetTitle(repliesContainer.Hidden ? "Show Replies" : "Hide Replies", UIControlState.Normal);
            };

            return showRepliesButton;
        }

        private async Task PostCommentAsync()
        {
            var commentText = newCommentInput.Text;
            if (string.IsNullOrEmpty(commentText)) return;

            var newComment = new Comment
            {
                ArticleId = articleId,
                Author = username,
                CommentText = commentText,
                ParentId = null,
                PostedDate = DateTime.UtcNow
            };

            try
            {
                await ApiService.PostCommentForArticle(articleId, newComment);
                newCommentInput.Text = "";
                LoadCommentsAsync();
            }
            catch (Exception ex)
            {
                ShowAlert("Error", $"Error posting comment: {ex.Message}");
            }
        }

        private async Task DeleteCommentAsync(int commentId)
        {
            var result = await ApiService.DeleteComment(commentId);
            if (result)
            {
                LoadCommentsAsync();
            }
            else
            {
                ShowAlert("Error", "Error deleting comment.");
            }
        }

        private void ShowReplyInput(int parentId)
        {
            var replyInput = new UITextField
            {
                Placeholder = "Write a reply...",
                BorderStyle = UITextBorderStyle.RoundedRect,
                TranslatesAutoresizingMaskIntoConstraints = false
            };

            var postReplyButton = new UIButton(UIButtonType.System)
            {
                TranslatesAutoresizingMaskIntoConstraints = false
            };
            postReplyButton.SetTitle("Post Reply", UIControlState.Normal);
            postReplyButton.TouchUpInside += async (sender, e) => await PostReplyAsync(parentId, replyInput.Text);

            commentsContainer.AddArrangedSubview(replyInput);
            commentsContainer.AddArrangedSubview(postReplyButton);
        }

        private async Task PostReplyAsync(int parentId, string replyText)
        {
            if (string.IsNullOrEmpty(replyText)) return;

            var newComment = new Comment
            {
                ArticleId = articleId,
                Author = username,
                CommentText = replyText,
                ParentId = parentId,
                PostedDate = DateTime.UtcNow
            };

            try
            {
                await ApiService.PostCommentForArticle(articleId, newComment);
                LoadCommentsAsync();
            }
            catch (Exception ex)
            {
                ShowAlert("Error", $"Error posting reply: {ex.Message}");
            }
        }

        private void ShowAlert(string title, string message)
        {
            var alert = UIAlertController.Create(title, message, UIAlertControllerStyle.Alert);
            alert.AddAction(UIAlertAction.Create("OK", UIAlertActionStyle.Default, null));
            PresentViewController(alert, true, null);
        }
    }
}
