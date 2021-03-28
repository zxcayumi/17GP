using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DPMS.Models;

namespace DPMS.Service
{
  public class DPMSDbContext : DbContext
  {
    public DPMSDbContext(DbContextOptions<DPMSDbContext> options)
    : base(options)
    { }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
    }

    public override int SaveChanges()
    {
      ChangeTracker.Entries().Where(e => (e.State == EntityState.Modified) && (e.Entity is IBaseEntity)).ToList().ForEach(e => {
        ((IBaseEntity)e.Entity).ModifiedTime = DateTime.Now;
      });
      ChangeTracker.Entries().Where(e => (e.State == EntityState.Added) && (e.Entity is IBaseEntity)).ToList().ForEach(e => {
        ((IBaseEntity)e.Entity).CreateTime = DateTime.Now;
        ((IBaseEntity)e.Entity).ModifiedTime = DateTime.Now;
      });
      return base.SaveChanges();
    }


    public DbSet<Models.Admin> Admins { get; set; }

    public DbSet<Models.Defence> Defences { get; set; }

    public DbSet<Models.DefenceNote> DefenceNotes { get; set; }

    public DbSet<Models.DefenceResult> DefenceResults { get; set; }

    public DbSet<Models.File> Files { get; set; }

    public DbSet<Models.Recorder> Recorders { get; set; }

    public DbSet<Models.Student> Students { get; set; }

    public DbSet<Models.Teacher> Teachers { get; set; }
  }
}
