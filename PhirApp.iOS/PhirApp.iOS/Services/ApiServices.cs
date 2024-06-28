using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Text;
using PhirApp.iOS.Models;
using static SystemConfiguration.NetworkReachability;
using Xamarin.Essentials;

namespace PhirApp.iOS.Services
{
    public static class ApiService
    {
        private static readonly HttpClient client = new HttpClient();

        static ApiService()
        {
            // Update the base URL to match your ASP.NET Core API address
            client.BaseAddress = new Uri("https://phiraapiproject.azurewebsites.net/");
            client.Timeout = TimeSpan.FromSeconds(30);
        }

        public static async Task<T> GetAsync<T>(string uri)
        {
            var response = await client.GetAsync(uri);
            response.EnsureSuccessStatusCode();

            var content = await response.Content.ReadAsStringAsync();
            return JsonConvert.DeserializeObject<T>(content);
        }

        public static async Task<List<Article>> FetchArticlesAsync()
        {
            try
            {
                var response = await client.GetAsync("api/articles");
                var json = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<Article>>(json);
                }
                else
                {
                    Console.WriteLine($"Failed to fetch articles: {response.StatusCode}");
                    Console.WriteLine($"Response: {json}");
                    return new List<Article>(); // Handle errors or empty responses as needed
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception in FetchArticlesAsync: {ex.Message}");
                return new List<Article>();
            }
        }

        public static async Task<List<Notification>> FetchNotificationsAsync()
        {
            try
            {
                var response = await client.GetAsync("api/notifications");
                var json = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<Notification>>(json);
                }
                else
                {
                    Console.WriteLine($"Failed to fetch notifications: {response.StatusCode}");
                    return new List<Notification>();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception in FetchNotificationsAsync: {ex.Message}");
                return new List<Notification>();
            }
        }

        public static async Task PostNotification(Notification notification)
        {
            var json = JsonConvert.SerializeObject(notification);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            try
            {
                HttpResponseMessage response = await client.PostAsync("api/notifications", content);
                if (!response.IsSuccessStatusCode)
                {
                    string responseContent = await response.Content.ReadAsStringAsync();
                    Console.WriteLine($"Failed to post notification: {response.StatusCode}, Response: {responseContent}");
                    throw new Exception($"Server error: {responseContent}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception in PostNotification: {ex.Message}");
                throw;
            }
        }

        public static async Task<List<Company>> FetchCompaniesAsync()
        {
            try
            {
                HttpResponseMessage response = await client.GetAsync("api/companies");
                string json = await response.Content.ReadAsStringAsync();
                Console.WriteLine($"Response JSON: {json}");

                if (response.IsSuccessStatusCode)
                {
                    Console.WriteLine("Successfully fetched companies.");
                    return JsonConvert.DeserializeObject<List<Company>>(json);
                }
                else
                {
                    Console.WriteLine($"Failed to fetch companies: {response.StatusCode}");
                    return new List<Company>();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error fetching companies: {ex.Message}");
                return new List<Company>();
            }
        }

        public static async Task<Article> FetchArticleByIdAsync(int articleId)
        {
            try
            {
                string url = $"https://phiraapiproject.azurewebsites.net/api/articles/{articleId}";
                var response = await client.GetStringAsync(url);
                var articles = JsonConvert.DeserializeObject<List<Article>>(response);

                if (articles != null && articles.Count > 0)
                {
                    return articles.First();
                }
                else
                {
                    Console.WriteLine("Article not found in the response.");
                    return null;
                }
            }
            catch (JsonSerializationException ex)
            {
                Console.WriteLine($"JSON serialization error: {ex.Message}");
                return null;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error fetching article by ID: {ex.Message}");
                return null;
            }
        }

        public static async Task<List<Article>> FetchArticlesForCompanyAsync(int companyId)
        {
            try
            {
                var response = await client.GetAsync($"api/companies/{companyId}/articles").ConfigureAwait(false);
                var json = await response.Content.ReadAsStringAsync().ConfigureAwait(false);
                if (response.IsSuccessStatusCode)
                {
                    Console.WriteLine("Successfully fetched articles for company.");
                    return JsonConvert.DeserializeObject<List<Article>>(json);
                }
                else
                {
                    Console.WriteLine($"Failed to fetch articles for company {companyId}: {response.StatusCode}");
                    Console.WriteLine($"Response Content: {json}"); // This will help understand what went wrong
                    return new List<Article>();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception when fetching articles for company {companyId}: {ex.Message}");
                return new List<Article>();
            }
        }

        public static async Task<List<Comment>> GetCommentsForArticle(int articleId)
        {
            try
            {
                var response = await client.GetAsync($"api/articles/{articleId}/comments");

                var json = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<Comment>>(json);
                }
                else
                {
                    Console.WriteLine($"Error fetching comments: {response.StatusCode}");
                    return new List<Comment>(); // Consider handling errors more gracefully
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception in GetCommentsForArticle: {ex.Message}");
                return new List<Comment>(); // Return empty list on exception
            }
        }

        public static async Task<Comment> FetchCommentById(int commentId)
        {
            try
            {
                var response = await client.GetAsync($"api/comments/{commentId}");
                var json = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<Comment>(json);
                }
                else
                {
                    Console.WriteLine($"Failed to fetch comment: {response.StatusCode}");
                    return null;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception in FetchCommentById: {ex.Message}");
                return null;
            }
        }

        public static async Task<List<Comment>> FetchComments(int articleId)
        {
            try
            {
                Console.WriteLine("articleid {0}", articleId);
                HttpResponseMessage response = await client.GetAsync($"api/articles/{articleId}/comments");
                string json = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<Comment>>(json);
                }
                else
                {
                    Console.WriteLine($"Failed to fetch comments: {response.StatusCode}, Response: {json}");
                    return new List<Comment>(); // Handle errors or empty responses as needed
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception in FetchComments: {ex.Message}");
                return new List<Comment>();
            }
        }

        public static async Task PostCommentForArticle(int articleId, Comment comment)
        {
            var json = JsonConvert.SerializeObject(comment);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            try
            {
                HttpResponseMessage response = await client.PostAsync($"api/articles/{articleId}/comments", content);
                if (!response.IsSuccessStatusCode)
                {
                    string responseContent = await response.Content.ReadAsStringAsync();
                    Console.WriteLine($"Failed to post comment: {response.StatusCode}, Response: {responseContent}");
                    throw new Exception($"Server error: {responseContent}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception in PostCommentForArticle: {ex.Message}");
                throw;
            }
        }

        public static async Task<bool> DeleteComment(int commentId)
        {
            try
            {
                HttpResponseMessage response = await client.DeleteAsync($"api/comments/{commentId}");
                if (response.IsSuccessStatusCode)
                {
                    return true;
                }
                else
                {
                    Console.WriteLine($"Error deleting comment: {response.StatusCode}");
                    return false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception deleting comment: {ex.Message}");
                return false;
            }
        }

        public static async Task<bool> ChangePassword(string username, string currentPassword, string newPassword, string confirmPassword)
        {
            var postData = new
            {
                Username = username,
                CurrentPassword = currentPassword,
                NewPassword = newPassword,
                ConfirmPassword = confirmPassword
            };

            var json = JsonConvert.SerializeObject(postData);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            try
            {
                HttpResponseMessage response = await client.PostAsync("api/users/change-password", content);
                string responseContent = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    Console.WriteLine("Password changed successfully.");
                    return true;
                }
                else
                {
                    // Handle failure scenario here
                    Console.WriteLine($"Error: {responseContent}");
                    return false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception: {ex.Message}");
                return false;
            }
        }

        public static async Task SendReplyNotification(ReplyNotificationRequest replyNotificationRequest)
        {
            var json = JsonConvert.SerializeObject(replyNotificationRequest);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            try
            {
                HttpResponseMessage response = await client.PostAsync("api/send-reply-notification", content);
                if (!response.IsSuccessStatusCode)
                {
                    string responseContent = await response.Content.ReadAsStringAsync();
                    Console.WriteLine($"Failed to send reply notification: {response.StatusCode}, Response: {responseContent}");
                    throw new Exception($"Server error: {responseContent}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception in SendReplyNotification: {ex.Message}");
                throw;
            }
        }

        public static async Task DeleteAllNotificationsAsync()
        {
            var url = $"api/notifications/deleteAll"; // Ensure you have the correct endpoint in your API
            var response = await client.DeleteAsync(url);
            response.EnsureSuccessStatusCode();
        }

        public static async Task MarkNotificationAsReadAsync(int notificationId)
        {
            var url = $"api/notifications/markAsRead/{notificationId}";
            var response = await client.PutAsync(url, null);
            response.EnsureSuccessStatusCode();
        }
    }
}
