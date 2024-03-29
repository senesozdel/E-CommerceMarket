namespace ReactApi.Models.RequestModels
{
    public class OrderProductRequest
    {
        public int Id { get; set; }
        public int UserId { get; set; }

        //public int ProductId { get; set; }

        public List<ProductList> Products { get; set; }


    }
}
