using ReactApi.Models.Datacontext;
using ReactApi.Models.Interfaces;

namespace ReactApi.Models.Services
{
    public class OrderService : IOrder
    {
        MyDb db;
        public OrderService(MyDb db)
        {
            this.db = db;
        }
        public Task<Order> AddOrderAsync(Order order)
        {
         
                db.Orders.Add(order);
                db.SaveChanges();


            return Task.FromResult(db.Orders.FirstOrDefault(x=>x == order));
        }

        public async Task<bool> DeleteOrderAsync(int id)
        {
            var getCategory = await GetOrderByIdAsync(id);
            var result = false;
            if (getCategory != null)
            {
                db.Remove(getCategory);
                db.SaveChanges();

                result = true;
            }
            return result;
        }

        public Task<Order> GetOrderByIdAsync(int id)
        {
            var order = db.Orders.FirstOrDefault(x => x.Id == id);
            return Task.FromResult(order);
        }

        public Task<List<Order>> GetOrdersAsync()
        {
            var OrderList = db.Orders.ToList();
            return Task.FromResult(OrderList);
        }

        public Task<bool> UpdateOrderAsync(Order order)
        {
            throw new NotImplementedException();
        }
    }
}
