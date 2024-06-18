namespace MyApiProject.Models
{
    public class ReplyNotificationRequest
    {
        public string ToUsername { get; set; }
        public string FromUsername { get; set; }
        public string Message { get; set; }
        public string Title { get; set; }  // Agrega la propiedad Title
    }
}
