using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.Models
{
    interface IBaseEntity
    {
        public DateTime? CreateTime { get; set; }

        public DateTime? ModifiedTime { get; set; }
    }
}
