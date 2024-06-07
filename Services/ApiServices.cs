using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Text;
using Android.Widget;
using Android.Content;
using Android.Util;

namespace PhirApp.Services
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
        public static async Task<List<Company>> FetchCompaniesAsync()
        {
            try
            {
                HttpResponseMessage response = await client.GetAsync("api/companies");
                string json = await response.Content.ReadAsStringAsync(); // Get the JSON string
                if (response.IsSuccessStatusCode)
                {
                    Log.Info("ApiService", "Successfully fetched companies.");
                    return JsonConvert.DeserializeObject<List<Company>>(json);
                }
                else
                {
                    Log.Error("ApiService", $"Failed to fetch companies: {response.StatusCode}");
                    Log.Debug("ApiService", $"Response Content: {json}"); // Log the raw response to understand what went wrong
                    return new List<Company>();
                }
            }
            catch (Exception ex)
            {
                Log.Error("ApiService", $"Error fetching companies: {ex.Message}");
                return new List<Company>();
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
                    Log.Info("ApiService", "Successfully fetched articles for company.");
                    return JsonConvert.DeserializeObject<List<Article>>(json);
                }
                else
                {
                    Log.Error("ApiService", $"Failed to fetch articles for company {companyId}: {response.StatusCode}");
                    Log.Debug("ApiService", $"Response Content: {json}"); // This will help understand what went wrong
                    return new List<Article>();
                }
            }
            catch (Exception ex)
            {
                Log.Error("ApiService", $"Exception when fetching articles for company {companyId}: {ex.Message}");
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
                    Console.WriteLine($"Error al recibir los comentarios: {response.StatusCode}");
                    return new List<Comment>(); // Consider handling errors more gracefully
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Excepción en GetCommentsForArticle: {ex.Message}");
                return new List<Comment>(); // Return empty list on exception
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
                    Log.Error("ApiService", $"Failed to fetch comments: {response.StatusCode}, Response: {json}");
                    return new List<Comment>(); // Handle errors or empty responses as needed
                }
            }
            catch (Exception ex)
            {
                Log.Error("ApiService", $"Excepción en FetchComments: {ex.Message}");
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
                    Log.Error("ApiService", $"Failed to post comment: {response.StatusCode}, Response: {responseContent}");
                    throw new Exception($"Server error: {responseContent}");
                }
            }
            catch (Exception ex)
            {
                Log.Error("ApiService", $"Excepción al publicar un comentario: {ex.Message}");
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
                    Console.WriteLine($"Error al borrar el comentario: {response.StatusCode}");
                    return false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Excepción al borrar el comentario: {ex.Message}");
                return false;
            }
        }
        public static async Task<bool> ChangePassword(Context context, string username, string currentPassword, string newPassword, string confirmPassword)
        {
            var postData = new Dictionary<string, string>
            {
                {"username", username},
                {"currentPassword", currentPassword},
                {"newPassword", newPassword},
                {"confirmPassword", confirmPassword}
            };

            var content = new FormUrlEncodedContent(postData);
            try
            {
                HttpResponseMessage response = await client.PostAsync("api/users/change-password", content);
                string responseContent = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    Toast.MakeText(context, "Contraseña cambiada correctamente.", ToastLength.Short).Show();
                    return true;
                }
                else
                {
                    // Handle failure scenario here
                    return false;
                }
            }
            catch (Exception ex)
            {
                Toast.MakeText(context, "Excepción: " + ex.Message, ToastLength.Long).Show();
                return false;
            }
        }
    }
}
