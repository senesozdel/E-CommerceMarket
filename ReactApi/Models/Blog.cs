namespace ReactApi.Models
{
    public class Blog
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }

        public User User { get; set; }

        public string Description { get; set; }

        public string Image { get; set; }

        

    }
}
