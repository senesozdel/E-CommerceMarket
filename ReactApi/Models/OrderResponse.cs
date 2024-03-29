namespace ReactApi.Models
{
    public class OrderResponse
    {
        public string Id { get; set; }
        public int OrderId { get; set; }
        public int UserID { get; set; }
        public List<Product> Products { get; set; }


    }
}
