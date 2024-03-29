namespace ReactApi.Models.Interfaces
{
    public interface ICategory
    {
        Task<List<Category>> GetAllCategoriesAsync();

        Task<Category> GetCategoryByIdAsync(int id);



    }
}
