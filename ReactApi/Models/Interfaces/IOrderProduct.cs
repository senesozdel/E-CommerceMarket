namespace ReactApi.Models.Interfaces
{
    public interface IOrderProduct
    {
        Task<List<OrderProduct>> GetOrdersDetailsAsync();

        Task<List<OrderProduct>> GetOrderByIdAsync(int orderId);

        Task<bool> AddOrderProductAsync(OrderProduct request);
        Task<bool> UpdateOrderAsync(OrderProduct orderProduct);
        Task<bool> DeleteOrderAsync(int id);
    }
}
