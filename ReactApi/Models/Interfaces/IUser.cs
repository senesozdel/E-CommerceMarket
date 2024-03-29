using ReactApi.Models.RequestModels;

namespace ReactApi.Models.Interfaces
{
    public interface IUser
    {
        Task<List<User>> GetUsersAsync();

        Task<User> GetUserByLoginAsync(UserRequest user);

        Task<User> AddUserAsync(UserRequest user);

    
    }
}
