using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using ReactApi.Models.Interfaces;
using ReactApi.Models.Services;
using System.Security.Claims;
using System;
using System.Text;
using Microsoft.EntityFrameworkCore;
using ReactApi.Models.Datacontext;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<MyDb>(options => options.UseSqlServer(@"data source=SENES;initial catalog=ReactApi;integrated security=true"));
builder.Services.AddTransient<IUser, UserService>();
builder.Services.AddTransient<IProduct, ProductService>();
builder.Services.AddTransient<IOrder, OrderService>();
builder.Services.AddTransient<IOrderProduct, OrderProductService>();
builder.Services.AddTransient<IFavori, FavoriService>();
builder.Services.AddTransient<IAuthService,AuthService>();
builder.Services.AddTransient<ITokenService,TokenService>();
string signkey = "MySecretkeyforapp12";
builder.Services.AddAuthentication(o =>
{
    o.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    o.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    o.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(t =>
{
    
    t.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
    {
        ValidIssuer = "bubenimissuer",
        ValidAudience = "bubenimaudience",
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(signkey)),
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true

    };
});

builder.Services.AddAuthorization();

// Program.cs dosyasýnda Main metodu içinde:
builder.Services.AddScoped<MyDb>();


// Configure CORS policy
builder.Services.AddCors(options =>
{
    options.AddPolicy("MyAllowSpecificOrigins",
                      policy =>
                      {
                          policy.WithOrigins("http://localhost:3000") // React uygulamanýzýn çalýþtýðý adres
                                .AllowAnyHeader()
                                .AllowAnyMethod();
                      });
});

//builder.Services.AddCors(options =>
//{
//    options.AddPolicy("MyAllowSpesificOrigins",
//    policy =>
//    {
//        policy.AllowAnyOrigin().AllowCredentials().AllowAnyHeader().AllowAnyMethod();
//    });

//    });

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseCors("MyAllowSpecificOrigins");

app.UseAuthentication();
app.UseAuthorization();


app.MapControllers();

app.Run();
