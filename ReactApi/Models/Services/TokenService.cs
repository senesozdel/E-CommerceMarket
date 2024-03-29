using Microsoft.IdentityModel.Tokens;
using ReactApi.Models.Interfaces;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace ReactApi.Models.Services
{
    public class TokenService:ITokenService
    {
        IConfiguration configuration;

        public TokenService(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public Task<GenerateTokenResponse>GenerateTokenAsync(GenerateTokenRequest tokenRequest)
        {
            SymmetricSecurityKey symmetricSecurity = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(configuration["AppSettings:Secret"]));

            var datetime = DateTime.Now;

            JwtSecurityToken jwt = new JwtSecurityToken(

                issuer: configuration["AppSettings:ValidIssuer"],
                audience: configuration["AppSettings:ValidAudience"],
                claims: new List<Claim>
                {
                    new Claim("userName",tokenRequest.UserName)
                },
                notBefore:datetime,
                expires:datetime.Add(TimeSpan.FromMinutes(1)),
                signingCredentials: new SigningCredentials(symmetricSecurity,SecurityAlgorithms.HmacSha256)


                );
            return Task.FromResult(new GenerateTokenResponse
            {
                Token = new JwtSecurityTokenHandler().WriteToken(jwt),
                TokenExpireDate = datetime.Add(TimeSpan.FromMinutes(1))
            });
                throw new NotImplementedException();

        }
    }
}
