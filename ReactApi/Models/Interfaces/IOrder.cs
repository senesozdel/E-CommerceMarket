namespace ReactApi.Models.Interfaces
{
    public interface IOrder
    {
       Task<List<Order>> GetOrdersAsync();

        Task<Order> GetOrderByIdAsync(int id);

        Task<Order> AddOrderAsync(Order order);
        Task<bool> UpdateOrderAsync(Order order);
        Task<bool> DeleteOrderAsync(int id);

    }
}
