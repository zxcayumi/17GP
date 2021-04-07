using System;
using System.Collections.Generic;

#nullable disable

namespace DPMS.Models
{
    public partial class DefenceNote
    {
        public int SystemId { get; set; }
        public string NoteId { get; set; }
        public string DefenceId { get; set; }
        public string StuId { get; set; }
        public string TeachId { get; set; }
        public string RecorderId { get; set; }
        public string Problem { get; set; }
        public string Answer { get; set; }
        public string Memo { get; set; }
        public string Status { get; set; }
        public DateTime? CreateTime { get; set; }
        public DateTime? UpdateTime { get; set; }
        public string Modifier { get; set; }

        public virtual Defence Defence { get; set; }
        public virtual Student Stu { get; set; }
        public virtual Teacher Teach { get; set; }
    }
}
