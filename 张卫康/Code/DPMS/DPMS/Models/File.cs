using System;
using System.Collections.Generic;

#nullable disable

namespace DPMS.Models
{
    public partial class File
    {
        public File()
        {
            Defences = new HashSet<Defence>();
        }

        public int SystemId { get; set; }
        public string FileId { get; set; }
        public string StuId { get; set; }
        public string DefenceId { get; set; }
        public string FileName { get; set; }
        public string Url { get; set; }
        public string Memo { get; set; }
        public string Status { get; set; }
        public DateTime? CreateTime { get; set; }
        public DateTime? UpdateTime { get; set; }
        public string Modifier { get; set; }

        public virtual ICollection<Defence> Defences { get; set; }
    }
}
