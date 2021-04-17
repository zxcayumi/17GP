using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace DPMS.ModelsDTO
{
  [Table("Admin")]
  public partial class AdminAddDTO
  {

    [Key]
    public string AdminId { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
    public string RealName { get; set; }
    public string Gender { get; set; }
    public string Mobile { get; set; }
    public string HeadPic { get; set; }
    public string College { get; set; }
    public string Department { get; set; }
    public string Major { get; set; }
    public string Memo { get; set; }
    public string Status { get; set; }
    public DateTime? CreateTime { get; set; }
    public DateTime? UpdateTime { get; set; }
    public string Modifier { get; set; }

  }
}
