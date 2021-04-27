using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL
{
    public class DBContext : DbContext
    {
        public DBContext(DbContextOptions<DBContext> options)
         : base(options)
        { }

        public DbSet<Models.IDCard> IDCards { get; set; }
        public DbSet<Models.BankCard> BankCards { get; set; }
        public DbSet<Models.SocialCard> SocialCards { get; set; }


        public DbSet<Models.CardDispenser> CardDispensers { get; set; }
        public DbSet<Models.CardReader> cardReaders { get; set; }

    }
}
