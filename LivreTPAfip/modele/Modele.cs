namespace LivreTPAfip.modele
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Modele : DbContext
    {
        public Modele()
            : base("name=Modele")
        {
        }

        public virtual DbSet<book> book { get; set; }
        public virtual DbSet<copy> copy { get; set; }
        public virtual DbSet<hasWrite> hasWrite { get; set; }
        public virtual DbSet<lend> lend { get; set; }
        public virtual DbSet<people> people { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Theme> Theme { get; set; }
        public virtual DbSet<writer> writer { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<book>()
                .HasMany(e => e.hasWrite)
                .WithRequired(e => e.book)
                .HasForeignKey(e => e.idbook)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<book>()
                .HasMany(e => e.copy)
                .WithRequired(e => e.book)
                .HasForeignKey(e => e.idBook)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<book>()
                .HasMany(e => e.Theme)
                .WithMany(e => e.book)
                .Map(m => m.ToTable("hasTheme").MapLeftKey("idbook").MapRightKey("idtheme"));

            modelBuilder.Entity<copy>()
                .HasMany(e => e.lend)
                .WithRequired(e => e.copy)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<people>()
                .HasMany(e => e.lend)
                .WithRequired(e => e.people)
                .HasForeignKey(e => e.idPeople)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<writer>()
                .HasMany(e => e.hasWrite)
                .WithRequired(e => e.writer)
                .HasForeignKey(e => e.idwriter)
                .WillCascadeOnDelete(false);
        }
    }
}
