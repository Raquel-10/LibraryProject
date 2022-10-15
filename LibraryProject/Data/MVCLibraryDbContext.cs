using LibraryProject.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace LibraryProject.Data
{
    public class MVCLibraryDbContext : DbContext
    {
        public MVCLibraryDbContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Autor> Autores { get; set; }
    }
}
