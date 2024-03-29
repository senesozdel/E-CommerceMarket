using Microsoft.AspNetCore.Mvc;
using ReactApi.Models;
using ReactApi.Models.Datacontext;
using ReactApi.Models.Interfaces;

namespace ReactApi.Models.Services
{
    public class OrderProductService : IOrderProduct
    {

        MyDb db;
        public OrderProductService(MyDb db)
        {
            this.db = db;
        }
        public Task<bool> AddOrderProductAsync(OrderProduct request)
        {
            var result = false;

            if(request != null)
            {
                db.OrderProducts.AddAsync(request);
                db.SaveChanges();
                result = true;
            }

   
            return Task.FromResult(result);


        }

        public Task<bool> DeleteOrderAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<OrderProduct>> GetOrderByIdAsync(int orderId)
         {
            List<OrderProduct> orderProducts = new List<OrderProduct>();

            foreach (var item in db.OrderProducts.ToList())
            {
                if(item.OrderId == orderId)
                {
                    orderProducts.Add(item);
                }
            }
            if (orderProducts != null)
            {
                return Task.FromResult(orderProducts);
            }
            return null;
        }

        public Task<List<OrderProduct>> GetOrdersDetailsAsync()
        {
            var allorderproducts = db.OrderProducts.ToList();
            return Task.FromResult(allorderproducts);
        }

        public Task<bool> UpdateOrderAsync(OrderProduct orderProduct)
        {
            throw new NotImplementedException();
        }
    }
}

//OrderProduct orderProduct = new OrderProduct();

//if (!String.IsNullOrEmpty(Convert.ToString(request.OrderId)))
//{
//    orderProduct.OrderId = request.OrderId;
//    orderProduct.ProductId = request.ProductId;
//    orderProduct.Quantity = request.Quantity;

//    db.OrderProducts.AddAsync(orderProduct);
//    db.SaveChanges();

//    result = true;
//}
//return Task.FromResult(result);