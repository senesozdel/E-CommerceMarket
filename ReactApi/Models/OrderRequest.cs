namespace ReactApi.Models
{
    public class OrderRequest
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public List<Product> Products { get; set; }

        public int UserId { get; set; }
        public int Quantity { get; set; }
    }
}
