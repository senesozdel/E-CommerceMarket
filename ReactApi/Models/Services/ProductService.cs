
using ReactApi.Models.Datacontext;
using ReactApi.Models.Interfaces;

namespace ReactApi.Models.Services
{
    public class ProductService : IProduct
    {
        MyDb db;

       public ProductService(MyDb db)
        {
            this.db = db;
        }
        public Task<bool> AddProductAsync(Product product)
        {
            var result = false;
            if (!String.IsNullOrEmpty(product.Name))
            {
                db.Products.AddAsync(product);
                db.SaveChanges();

                result = true;
            }
            return Task.FromResult(result);
        }

        public async Task<bool> DeleteProductAsync(int id)
        {
            var getProduct = await GetProductByIdAsync(id);
            var result = false;
            if (getProduct != null)
            {
                db.Remove(getProduct);
                db.SaveChanges();

                result = true;
            }
            return result;
        }

        public Task<List<Product>> GetAllProductsAsync()
        {
            var ProductList = db.Products.ToList();
            return Task.FromResult(ProductList);
        }

        public Task<Product> GetProductByIdAsync(int id)
        {
            var product = db.Products.FirstOrDefault(x => x.Id == id);
            return Task.FromResult(product);
        }

        public async Task<bool> UpdateProductAsync(Product product)
        {
            var getProduct = await GetProductByIdAsync(product.Id);
            var result = false;
            if (getProduct != null && product.Name != null)
            {
                getProduct.Name = product.Name;
                getProduct.Description = product.Description;
                db.SaveChanges();
                result = true;
            }

            return result;
        }
    }
}

