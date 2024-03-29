using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using ReactApi.Models;
using ReactApi.Models.Datacontext;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace ReactApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReactTokenLoginController : ControllerBase
    {
        MyDb db;
        string signkey = "MySecretkeyforapp12";

        public ReactTokenLoginController(MyDb db)
        {
            this.db = db;
        }
        [HttpPost]
        public TokenModel Post([FromBody] LoginRequest request)
        {
            var claims = new[]
            {
                new Claim(ClaimTypes.Name, request.UserName),
                new Claim(JwtRegisteredClaimNames.Email,request.UserName)
            };

            var securitykey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(signkey));

            var credentials= new SigningCredentials(securitykey,SecurityAlgorithms.HmacSha256);


            if(String.IsNullOrEmpty(request.UserName)&& String.IsNullOrEmpty(request.Password))  { 
            
                throw new ArgumentNullException(nameof(request));
            
            }

            var user = db.Users.FirstOrDefault(x=>x.Name == request.UserName && x.Password== request.Password);
            TokenModel tokenModel = new TokenModel();
            if (user != null)
            {
                var jwtsecuritytoken = new JwtSecurityToken(
      issuer: "bubenimissuer",
      audience: "bubenimaudience",
      claims: claims,
      expires: DateTime.Now.AddMinutes(30),
      notBefore: DateTime.Now,
      signingCredentials: credentials
    );

   

                tokenModel.TokenBody = new JwtSecurityTokenHandler().WriteToken(jwtsecuritytoken);
                tokenModel.CurrentUser = user;
            }
            return tokenModel;

        }
        [HttpGet("ValidateToken")]

        public bool ValidateToken(string token)
        {
            var securitykey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(signkey));
            try
            {
                JwtSecurityTokenHandler handler = new();
                handler.ValidateToken(token, new TokenValidationParameters()
                {
                    IssuerSigningKey = securitykey,
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true
                }, out SecurityToken validatedToken);
                var jwtToken = (JwtSecurityToken)validatedToken;
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}
