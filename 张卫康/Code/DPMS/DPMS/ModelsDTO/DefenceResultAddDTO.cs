using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace DPMS.ModelsDTO
{
  [Table("DefenceResult")]

  public partial class DefenceResultAddDTO
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

  }
}
