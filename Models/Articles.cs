using System;

public class Article
{
    public int Id { get; set; }
    public string Title { get; set; }
    public string Text { get; set; }
    public string Image { get; set; } // Base64 string of the image
    public int ParentId { get; set; }
    public DateTime PublishedDate { get; set; } // Ensure this property exists
}
