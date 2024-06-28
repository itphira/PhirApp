using System;

namespace PhirApp.iOS.Models
{
    public class ArticleResponse
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Text { get; set; }
        public string Image { get; set; }
        public DateTime PublishedDate { get; set; }
        public string Author { get; set; }
    }
}
