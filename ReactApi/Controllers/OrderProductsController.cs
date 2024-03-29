using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ReactApi.Models;
using ReactApi.Models.Datacontext;
using ReactApi.Models.Interfaces;
using ReactApi.Models.RequestModels;

namespace ReactApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderProductsController : ControllerBase
    {
        private readonly IOrderProduct orderProduct;
        private readonly IOrder _order;
        private readonly IProduct _product;
        MyDb db;

        public OrderProductsController(IOrderProduct orderProduct, IProduct product, IOrder order,MyDb db)
        {
            this.orderProduct = orderProduct;
            this._order = order;
            this._product = product;
            this.db = db;
        }

        [HttpGet]

        public Task<List<OrderProduct>> Get()
        {
            return orderProduct.GetOrdersDetailsAsync();
        }
        [HttpGet("{id}")]

        public Task<List<OrderProduct>> Get(int id)
        {
            return orderProduct.GetOrderByIdAsync(id);
        }

        [HttpPost]
        public async  Task<bool> AddOrderProduct([FromBody] OrderProductRequest  request)
        {

            Order normalorder = new Order();

            normalorder.OrderDate =  DateTime.Now;
            normalorder.UserId = request.UserId;

             var bulunanorder=await _order.AddOrderAsync(normalorder);


        

            foreach (var item in request.Products)
            {
                OrderProduct orderProduct = new OrderProduct();
                orderProduct.ProductId = item.Id;
                orderProduct.Quantity = item.Productquantity;
                orderProduct.OrderId = bulunanorder.Id;
                await this.orderProduct.AddOrderProductAsync(orderProduct);
            }







            //OrderResponse response = new OrderResponse();
          
            //var allproducts = db.OrderProducts.ToList();

            //List<Product> resproducts = new List<Product>();

            //foreach (var item in allproducts)
            //{
            //    if(request.ProductId == item.ProductId)
            //    {
            //        var eklenenproduct = db.Products.FirstOrDefault(x => x.Id == request.ProductId);
            //        resproducts.Add(eklenenproduct);
            //    }
            //}
            //response.Id = Guid.NewGuid().ToString();
            //response.OrderId = bulunanorder.Id;
            //response.UserID = request.UserId;
            //response.Products = resproducts;

            return true;

        }


    }
}


//var enbuyuk = db.Orders.OrderByDescending(x => x.Id).FirstOrDefault().Id;

//Order beforeresponseorder = new Order()
//{

//    OrderDate = DateTime.Now,
//    UserId = request.UserId,

//};
//var addedOrder = await _order.AddOrderAsync(beforeresponseorder);

//OrderResponse response = new OrderResponse();





//response.Products = request.Products;
//response.OrderId = db.Orders.FirstOrDefault(x => x.Id == addedOrder.Id).Id;
//response.UserID = request.UserId;

//OrderProduct orderProduct = new OrderProduct()
//{
//    OrderId = addedOrder.Id,
//    Quantity = request.Quantity,
//    ProductId = request.Products.FirstOrDefault().Id
//};
//this.orderProduct.AddOrderProductAsync(orderProduct);

//return response;