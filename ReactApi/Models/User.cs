namespace ReactApi.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public string ?SurName { get; set; }

        public List<Order> Orders { get; set; }

        public List<Favori> Favourites { get; set; }
    }
}
