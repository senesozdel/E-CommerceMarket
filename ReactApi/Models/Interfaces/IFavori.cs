using ReactApi.Models.RequestModels;

namespace ReactApi.Models.Interfaces
{
    public interface IFavori
    {
        Task<List<Favori>> GetFavoritesAsync();

       Task<List<Favori>> GetFavoritesByUserAsync(int userId);

        Task<bool> AddFavoriAsync(FavoriRequest favori);

        Task<bool> DeleteFavoriAsync(FavoriRequest favori);

        Task<bool> UpdateFavoriAsync(FavoriRequest favori);
    }
}
