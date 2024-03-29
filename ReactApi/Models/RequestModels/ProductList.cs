namespace ReactApi.Models.RequestModels
{
    public class ProductList
    {
        public int Id { get; set; }
        public string? Productname { get; set; }

        public double? Productprice { get; set; }

        public int Productquantity { get; set; }
    }
}
