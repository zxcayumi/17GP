using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace DPMS.ModelsDTO
{
  [Table("DefenceNote")]

  public partial class DefenceNoteAddDTO
    {

    [Key]
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

  }
}
