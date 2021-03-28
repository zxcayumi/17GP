using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace DPMS.Models
{
    public partial class DPMSContext : DbContext
    {
        public DPMSContext()
        {
        }

        public DPMSContext(DbContextOptions<DPMSContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Defence> Defences { get; set; }
        public virtual DbSet<DefenceNote> DefenceNotes { get; set; }
        public virtual DbSet<DefenceResult> DefenceResults { get; set; }
        public virtual DbSet<File> Files { get; set; }
        public virtual DbSet<Recorder> Recorders { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<Teacher> Teachers { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=DPMS;Persist Security Info=True;User ID=sa;PWD=123456");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Chinese_PRC_CI_AS");

            modelBuilder.Entity<Admin>(entity =>
            {
                entity.ToTable("Admin");

                entity.HasIndex(e => e.Email, "IX_Admin")
                    .IsUnique();

                entity.HasIndex(e => e.Mobile, "IX_Admin_1")
                    .IsUnique();

                entity.Property(e => e.AdminId)
                    .HasMaxLength(50)
                    .HasColumnName("AdminID");

                entity.Property(e => e.College)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreateTime).HasColumnType("datetime");

                entity.Property(e => e.Department)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.Gender).HasMaxLength(1);

                entity.Property(e => e.HeadPic).HasMaxLength(250);

                entity.Property(e => e.Major)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Memo).HasMaxLength(250);

                entity.Property(e => e.Mobile).HasMaxLength(50);

                entity.Property(e => e.Modifier).HasMaxLength(50);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(250);

                entity.Property(e => e.RealName)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.Status).HasMaxLength(50);

                entity.Property(e => e.SystemId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("SystemID");

                entity.Property(e => e.UpdateTime).HasColumnType("datetime");
            });

            modelBuilder.Entity<Defence>(entity =>
            {
                entity.ToTable("Defence");

                entity.Property(e => e.DefenceId)
                    .HasMaxLength(50)
                    .HasColumnName("DefenceID");

                entity.Property(e => e.CreateTime).HasColumnType("datetime");

                entity.Property(e => e.DefenceName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.FileId)
                    .HasMaxLength(50)
                    .HasColumnName("FileID");

                entity.Property(e => e.Memo).HasMaxLength(500);

                entity.Property(e => e.Method).HasMaxLength(250);

                entity.Property(e => e.Modifier).HasMaxLength(50);

                entity.Property(e => e.Outline).HasMaxLength(500);

                entity.Property(e => e.Status).HasMaxLength(50);

                entity.Property(e => e.StuId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("StuID");

                entity.Property(e => e.SystemId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("SystemID");

                entity.Property(e => e.TeachId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("TeachID");

                entity.Property(e => e.UpdateTime).HasColumnType("datetime");

                entity.Property(e => e.WorkSatus)
                    .IsRequired()
                    .HasMaxLength(2);
            });

            modelBuilder.Entity<DefenceNote>(entity =>
            {
                entity.HasKey(e => e.NoteId);

                entity.ToTable("Defence_Note");

                entity.Property(e => e.NoteId)
                    .HasMaxLength(50)
                    .HasColumnName("NoteID");

                entity.Property(e => e.Answer).HasMaxLength(500);

                entity.Property(e => e.CreateTime).HasColumnType("datetime");

                entity.Property(e => e.DefenceId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("DefenceID");

                entity.Property(e => e.Memo).HasMaxLength(500);

                entity.Property(e => e.Modifier).HasMaxLength(50);

                entity.Property(e => e.Problem).HasMaxLength(500);

                entity.Property(e => e.Status).HasMaxLength(50);

                entity.Property(e => e.StuId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("StuID");

                entity.Property(e => e.SystemId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("SystemID");

                entity.Property(e => e.TeachId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("TeachID");

                entity.Property(e => e.UpdateTime).HasColumnType("datetime");
            });

            modelBuilder.Entity<DefenceResult>(entity =>
            {
                entity.HasKey(e => e.ResultId);

                entity.ToTable("Defence_Result");

                entity.Property(e => e.ResultId)
                    .HasMaxLength(50)
                    .HasColumnName("ResultID");

                entity.Property(e => e.Achievement)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreateTime).HasColumnType("datetime");

                entity.Property(e => e.EvaluateForStu).HasMaxLength(500);

                entity.Property(e => e.EvaluateForTea).HasMaxLength(500);

                entity.Property(e => e.Memo).HasMaxLength(500);

                entity.Property(e => e.Modifier).HasMaxLength(50);

                entity.Property(e => e.Status).HasMaxLength(50);

                entity.Property(e => e.StuId)
                    .HasMaxLength(50)
                    .HasColumnName("StuID");

                entity.Property(e => e.SystemId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("SystemID");

                entity.Property(e => e.TeachId)
                    .HasMaxLength(50)
                    .HasColumnName("TeachID");

                entity.Property(e => e.UpdateTime).HasColumnType("datetime");
            });

            modelBuilder.Entity<File>(entity =>
            {
                entity.ToTable("File");

                entity.Property(e => e.FileId)
                    .HasMaxLength(50)
                    .HasColumnName("FileID");

                entity.Property(e => e.CreateTime).HasColumnType("datetime");

                entity.Property(e => e.DefenceId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("DefenceID");

                entity.Property(e => e.Memo).HasMaxLength(500);

                entity.Property(e => e.Modifier).HasMaxLength(50);

                entity.Property(e => e.Status).HasMaxLength(50);

                entity.Property(e => e.StuId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("StuID");

                entity.Property(e => e.SystemId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("SystemID");

                entity.Property(e => e.UpdateTime).HasColumnType("datetime");

                entity.Property(e => e.Url)
                    .IsRequired()
                    .HasMaxLength(500)
                    .HasColumnName("URL");
            });

            modelBuilder.Entity<Recorder>(entity =>
            {
                entity.ToTable("Recorder");

                entity.HasIndex(e => e.Email, "IX_Recorder")
                    .IsUnique();

                entity.HasIndex(e => e.Mobile, "IX_Recorder_1")
                    .IsUnique();

                entity.Property(e => e.RecorderId)
                    .HasMaxLength(50)
                    .HasColumnName("RecorderID");

                entity.Property(e => e.CreateTime).HasColumnType("datetime");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.Gender)
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.HeadPic).HasMaxLength(250);

                entity.Property(e => e.Memo).HasMaxLength(250);

                entity.Property(e => e.Mobile).HasMaxLength(50);

                entity.Property(e => e.Modifier).HasMaxLength(50);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(250);

                entity.Property(e => e.Qqid)
                    .HasMaxLength(50)
                    .HasColumnName("QQID");

                entity.Property(e => e.RealName)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.Status).HasMaxLength(50);

                entity.Property(e => e.SystemId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("SystemID");

                entity.Property(e => e.UpdateTime).HasColumnType("datetime");

                entity.Property(e => e.WeChatId)
                    .HasMaxLength(50)
                    .HasColumnName("WeChatID");
            });

            modelBuilder.Entity<Student>(entity =>
            {
                entity.HasKey(e => e.StuId);

                entity.ToTable("Student");

                entity.HasIndex(e => e.Email, "IX_Student")
                    .IsUnique();

                entity.HasIndex(e => e.Mobile, "IX_Student_1")
                    .IsUnique();

                entity.Property(e => e.StuId)
                    .HasMaxLength(50)
                    .HasColumnName("StuID");

                entity.Property(e => e.Birthday).HasColumnType("datetime");

                entity.Property(e => e.Class)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.College)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreateTime).HasColumnType("datetime");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.Gender).HasMaxLength(1);

                entity.Property(e => e.Grade)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Group)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.HeadPic).HasMaxLength(250);

                entity.Property(e => e.Major)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Memo).HasMaxLength(500);

                entity.Property(e => e.Mobile).HasMaxLength(50);

                entity.Property(e => e.Modifier).HasMaxLength(50);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(250);

                entity.Property(e => e.RealName)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.Status).HasMaxLength(50);

                entity.Property(e => e.StudentStatus).HasMaxLength(5);

                entity.Property(e => e.SystemId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("SystemID");

                entity.Property(e => e.UpdateTime).HasColumnType("datetime");
            });

            modelBuilder.Entity<Teacher>(entity =>
            {
                entity.HasKey(e => e.TeachId);

                entity.ToTable("Teacher");

                entity.HasIndex(e => e.Email, "IX_Teacher");

                entity.Property(e => e.TeachId)
                    .HasMaxLength(50)
                    .HasColumnName("TeachID");

                entity.Property(e => e.CreateTime).HasColumnType("datetime");

                entity.Property(e => e.DataStatus).HasMaxLength(50);

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.Gender)
                    .HasMaxLength(1)
                    .IsFixedLength(true);

                entity.Property(e => e.GroupCategory)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.GroupNumber)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.HeadPic).HasMaxLength(250);

                entity.Property(e => e.Memo).HasMaxLength(250);

                entity.Property(e => e.Mobile)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Modifier).HasMaxLength(50);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(250);

                entity.Property(e => e.RealName)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.Status).HasMaxLength(5);

                entity.Property(e => e.SystemId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("SystemID");

                entity.Property(e => e.TeacherStatus).HasMaxLength(5);

                entity.Property(e => e.UpdateTime).HasColumnType("datetime");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
