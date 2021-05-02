using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace DPMS.Models
{
  [Table("DefenceResult")]
  public partial class DefenceResult
    {
        [Key]
        public string ResultId { get; set; }
        public string DefenceId { get; set; }
        public string StuId { get; set; }
        public string TeachId { get; set; }
        public string EvaluateForTea { get; set; }
        public string EvaluateForStu { get; set; }
        public string Achievement { get; set; }
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
