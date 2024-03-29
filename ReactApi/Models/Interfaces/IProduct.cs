namespace ReactApi.Models.Interfaces
{
    public interface IProduct
    {
        Task<List<Product>> GetAllProductsAsync();

        Task<Product> GetProductByIdAsync(int id);

       Task<bool> AddProductAsync(Product product);
        Task<bool> UpdateProductAsync(Product product);
        Task<bool> DeleteProductAsync(int id);

    }
}
