using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReactApi.Models;
using ReactApi.Models.Interfaces;

namespace ReactApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProduct _product;

        public ProductController(IProduct product)
        {
            this._product = product;
        }

        [HttpGet]

        public Task<List<Product>> Get()
        {
            return _product.GetAllProductsAsync();
        }
        [HttpGet("{id}")]

        public Task<Product> Get(int id)
        {
            return _product.GetProductByIdAsync(id);
        }



    }
}
