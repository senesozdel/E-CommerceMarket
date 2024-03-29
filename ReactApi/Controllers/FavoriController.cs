using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReactApi.Models;
using ReactApi.Models.Interfaces;
using ReactApi.Models.RequestModels;

namespace ReactApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FavoriController : ControllerBase
    {
        private readonly IFavori _favori;

            public FavoriController(IFavori favori)
        {
            _favori = favori;
        }

        [HttpGet]
        public Task<List<Favori>> GetFavoritesAsync()
        {
            return _favori.GetFavoritesAsync();
        }
        [HttpGet("{userId}")]
        public Task<List<Favori>> GetFavoritesByUserAsync( int userId)
        {
            return _favori.GetFavoritesByUserAsync(userId);
        }

        [HttpPost]

        public Task<bool> AddFavoriPost([FromBody] FavoriRequest favori)
        {
            return _favori.AddFavoriAsync(favori);
        }

        [HttpDelete]

        public Task<bool> DeleteFavoriAsync([FromBody] FavoriRequest favori)
        {
            return _favori.DeleteFavoriAsync(favori);
        }
        [HttpPut]

        public Task<bool> UpdateFavoriAsync([FromBody] FavoriRequest favori)
        {
            return _favori.UpdateFavoriAsync(favori);
        }
        }
}
