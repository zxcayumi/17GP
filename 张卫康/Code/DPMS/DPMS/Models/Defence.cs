using System;
using System.Collections.Generic;

#nullable disable

namespace DPMS.Models
{
    public partial class Defence
    {
        public Defence()
        {
            DefenceNotes = new HashSet<DefenceNote>();
            DefenceResults = new HashSet<DefenceResult>();
        }

        public int SystemId { get; set; }
        public string DefenceId { get; set; }
        public string StuId { get; set; }
        public string TeachId { get; set; }
        public string FileId { get; set; }
        public string DefenceName { get; set; }
        public string Method { get; set; }
        public string Outline { get; set; }
        public string WorkSatus { get; set; }
        public string Memo { get; set; }
        public string Status { get; set; }
        public DateTime? CreateTime { get; set; }
        public DateTime? UpdateTime { get; set; }
        public string Modifier { get; set; }

        public virtual File File { get; set; }
        public virtual ICollection<DefenceNote> DefenceNotes { get; set; }
        public virtual ICollection<DefenceResult> DefenceResults { get; set; }
    }
}
