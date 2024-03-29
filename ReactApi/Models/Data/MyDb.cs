using Microsoft.EntityFrameworkCore;

namespace ReactApi.Models.Datacontext
{
    public class MyDb : DbContext
    {
        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    optionsBuilder.UseSqlServer(@"data source=SENES;initial catalog=ReactApi;integrated security=true");
        //}

        public MyDb(DbContextOptions<MyDb> options) : base(options)
        {
        }
        public DbSet<Category> Categories { get; set; }
        public DbSet<User> Users { get; set; }

        public DbSet<Product> Products { get; set; }

        public DbSet<Blog> Blogs { get; set; }
        public DbSet<Favori> Favorites { get; set; }
        public DbSet<OrderProduct> OrderProducts { get; set; }
        public DbSet<Order> Orders { get; set; }



    }
}
