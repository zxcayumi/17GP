using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace DPMS.ModelsDTO
{
  [Table("File")]

  public partial class FileAddDTO
  {

    [Key]
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

  }
}
