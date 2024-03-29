using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReactApi.Models;
using ReactApi.Models.Interfaces;
using ReactApi.Models.Services;

namespace ReactApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        readonly IAuthService _authService;

        public  AuthController(IAuthService authService)
        {
            this._authService = authService;
        }

        [HttpPost("Login")]

        public async Task<ActionResult<LoginResponse>> LoginAsync([FromBody] LoginRequest request)
        {
            var result = await _authService.LoginAsync(request);

            return result;
        }
    }
}
