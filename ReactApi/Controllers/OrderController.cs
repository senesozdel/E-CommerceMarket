using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReactApi.Models;
using ReactApi.Models.Interfaces;

namespace ReactApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly IOrder order;

        public OrderController(IOrder order)
        {
            this.order = order;
        }

        [HttpGet]

        public Task<List<Order>> Get()
        {
            return order.GetOrdersAsync();
        }
        [HttpGet("{id}")]

        public Task<Order> Get(int id)
        {
            return order.GetOrderByIdAsync(id);
        }

        [HttpPost]

        public Task<Order> AddOrder([FromBody] Order order)
        {
            return this.order.AddOrderAsync(order);
        }

        [HttpDelete]

        public Task<bool> DeleteOrder([FromBody] int id)
        {
            return this.order.DeleteOrderAsync(id);
        }
    }
}
