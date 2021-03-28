using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace DPMS.Models
{
  [Table("DefenceNote")]

  public partial class DefenceNote
    {
    [MaxLength(50)]
    public int SystemId { get; set; }

    [MaxLength(50)]
    [Key]
    public string NoteId { get; set; }

    [MaxLength(50)]
    public string DefenceId { get; set; }

    [MaxLength(50)]
    public string StuId { get; set; }

    [MaxLength(50)]
    public string TeachId { get; set; }

    [MaxLength(500)]
    public string Problem { get; set; }

    [MaxLength(500)]
    public string Answer { get; set; }




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
