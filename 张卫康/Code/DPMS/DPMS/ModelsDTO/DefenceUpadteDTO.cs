using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace DPMS.ModelsDTO
{
  [Table("Defence")]

  public partial class DefenceUpdateDTO
  {
    [MaxLength(50)]
    public int SystemId { get; set; }

    [MaxLength(50)]
    [Key]
    public string DefenceId { get; set; }

    [MaxLength(50)]
    public string StuId { get; set; }

    [MaxLength(50)]
    public string TeachId { get; set; }

    [MaxLength(50)]
    public string DefenceName { get; set; }

    [MaxLength(250)]
    public string Method { get; set; }

    [MaxLength(500)]
    public string Outline { get; set; }

    [MaxLength(50)]
    public string FileId { get; set; }

    [MaxLength(2)]
    public string WorkSatus { get; set; }




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
