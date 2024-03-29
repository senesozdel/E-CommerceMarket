using ReactApi.Models.Interfaces;

namespace ReactApi.Models.Services
{
    public class AuthService : IAuthService
    {
        readonly ITokenService tokenService;
        
        public AuthService(ITokenService tokenService)
        {
            this.tokenService = tokenService;
        }
        public async Task<LoginResponse> LoginAsync(LoginRequest request)
        {
            LoginResponse response = new LoginResponse();

            if(String.IsNullOrEmpty(request.UserName) || String.IsNullOrEmpty(request.Password)  ) 
            {
                throw new ArgumentNullException(nameof(request));
            }
            if (request.UserName == "senes" && request.Password == "123")
            {

                var generatedTokenInfo = await tokenService.GenerateTokenAsync(new GenerateTokenRequest { UserName = request.UserName });

                response.AccesTokenCreationDate = generatedTokenInfo.TokenExpireDate;
                response.AuthenticateResult = true;
                response.AuthToken = generatedTokenInfo.Token;
            }

            return response;
        }
    }
}
