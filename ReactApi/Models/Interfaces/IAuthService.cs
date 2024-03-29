namespace ReactApi.Models.Interfaces
{
    public interface IAuthService
    {
        public Task<LoginResponse> LoginAsync(LoginRequest request);
    }
}
