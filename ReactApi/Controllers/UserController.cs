using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReactApi.Models;
using ReactApi.Models.Interfaces;
using ReactApi.Models.RequestModels;

namespace ReactApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        IUser _user;
        public UserController(IUser user) {

            _user = user;
       
        }
        [HttpGet]

        public Task<List<User>> Get()
        {
            return _user.GetUsersAsync();
        }
        [Authorize]
        [HttpPost("GetUserByLogin")]

        public Task<User> Get([FromBody] UserRequest user)
        {
            return _user.GetUserByLoginAsync(user);
        }
        [HttpPost]

        public Task<User> AddUser([FromBody] UserRequest user)
        {
            return _user.AddUserAsync(user);
        }
    }
}
