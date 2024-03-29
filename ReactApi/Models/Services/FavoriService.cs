using ReactApi.Models.Datacontext;
using ReactApi.Models.Interfaces;
using ReactApi.Models.RequestModels;

namespace ReactApi.Models.Services
{
    public class FavoriService : IFavori
    {
        MyDb db;
        public FavoriService(MyDb db)
        {
            this.db = db;
        }
        public Task<List<Favori>> GetFavoritesAsync()
        {
            var FavoriList = db.Favorites.ToList();
            return Task.FromResult(FavoriList);
        }

        public Task<List<Favori>> GetFavoritesByUserAsync(int userId)
        {
            var FavoriList = db.Favorites.Where(x=>x.UserId == userId ).ToList();
            return Task.FromResult(FavoriList);
        }

        public Task<bool> AddFavoriAsync(FavoriRequest favori)
        {
            Favori fav = new Favori()
            {
                ProductId = favori.ProductId,
                UserId = favori.UserId,
            };
            if (!db.Favorites.Any(x => x.ProductId == fav.ProductId && x.UserId == fav.UserId))
            {
                db.Favorites.Add(fav);
                db.SaveChanges();
            }


                return Task.FromResult(true);
        }

        public Task<bool> DeleteFavoriAsync(FavoriRequest favori)
        {
            
            var degisecek = db.Favorites.Where(x => x.ProductId == favori.ProductId && x.UserId == favori.UserId).FirstOrDefault();

            if(degisecek != null)
            {
                degisecek.IsDeleted = true;
                db.SaveChanges();
            }

            return Task.FromResult(true);
        }
        public Task<bool> UpdateFavoriAsync(FavoriRequest favori)
        {

            var degisecek = db.Favorites.Where(x => x.ProductId == favori.ProductId && x.UserId == favori.UserId).FirstOrDefault();

            if(degisecek == null) 
            {
                AddFavoriAsync(favori);
            }

            else if (degisecek != null && degisecek.IsDeleted == true)
            {
                degisecek.IsDeleted = false;
                db.SaveChanges();
            }
            else if (degisecek != null && degisecek.IsDeleted == false)
            {
                degisecek.IsDeleted = true;
                db.SaveChanges();
            }

            return Task.FromResult(true);
        }
    }
}
