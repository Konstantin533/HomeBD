using Microsoft.EntityFrameworkCore;

namespace Book.Models
{
    public class AplicationContext : DbContext
    {
        public DbSet<BookClass> Books { get; set; }
        public AplicationContext(DbContextOptions<AplicationContext> options) : base(options)
          
        {
            Database.EnsureCreated();
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BookClass>().HasData(

                new BookClass { Id = 1, Name = "Master and Margarita", Author = "Michel Bolgagov", Year = 1930 },
                new BookClass { Id = 2, Name = "Mertvie Dushi", Author = "Nikola Gogol", Year = 1842 },
                new BookClass { Id = 3, Name = "Voina i Mir", Author = "Lev Tolstoi", Year = 1868 },
                new BookClass { Id = 4, Name = "Anna Karenina", Author = "Lev Tolstoi", Year = 1877 },
                new BookClass { Id = 5, Name = "Prestupleni i nakazanie", Author = "Fedor Dostoevski", Year = 1866 }
                );
        }
    }
}
