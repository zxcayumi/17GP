using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace DPMS.ModelsDTO
{
  [Table("DefenceResult")]

  public partial class DefenceResultUpdateDTO
  {
    [MaxLength(50)]
    public int SystemId { get; set; }

    [MaxLength(50)]
    [Key]
    public string ResultId { get; set; }

    [MaxLength(50)]
    public string StuId { get; set; }

    [MaxLength(50)]
    public string TeachId { get; set; }

    [MaxLength(500)]
    public string EvaluateForTea { get; set; }

    [MaxLength(500)]
    public string EvaluateForStu { get; set; }

    [MaxLength(50)]
    public string Achievement { get; set; }




    [MaxLength(500)]
    public string Memo { get; set; }

    [MaxLength(50)]
    public string Status { get; set; }

    public DateTime? CreateTime { get; set; }

    public DateTime? UpdateTime { get; set; }

    [MaxLength(50)]
    public string Modifier { get; set; }
    }
}
