using System;

namespace PhirApp.iOS.Models
{
    public class Articles
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string ImageUrl { get; set; }
        public DateTime PublishDate { get; set; }
        public string Author { get; set; }
    }
}
