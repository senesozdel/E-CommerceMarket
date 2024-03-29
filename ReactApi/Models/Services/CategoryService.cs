using ReactApi.Models.Datacontext;
using ReactApi.Models.Interfaces;

namespace ReactApi.Models.Services
{
    public class CategoryService : ICategory
    {
        MyDb db;

        public CategoryService(MyDb db)
        {
            this.db = db;
        }
        public Task<List<Category>> GetAllCategoriesAsync()
        {
            var categoryList = db.Categories.ToList();
            return Task.FromResult(categoryList);
        }

        public Task<Category> GetCategoryByIdAsync(int id)
        {
            var category = db.Categories.FirstOrDefault(x => x.Id == id);
            return Task.FromResult(category);
        }
    }
}
