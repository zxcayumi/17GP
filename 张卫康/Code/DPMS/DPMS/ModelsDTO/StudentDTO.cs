using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace DPMS.ModelsDTO
{
  [Table("Admin")]
  public partial class StudentDTO
    {
    [MaxLength(50)]
    public int SystemId { get; set; }

    [MaxLength(50)]
    [Key]
    public string StuId { get; set; }

    [MaxLength(50)]
    public string Email { get; set; }

    [MaxLength(250)]
    public string Password { get; set; }

    [MaxLength(10)]
    public string RealName { get; set; }

    [MaxLength(50)]
    public string Gender { get; set; }

    [MaxLength(50)]
    public string Mobile { get; set; }

    [MaxLength(1)]
    public bool? IsValidMobile { get; set; }

    [MaxLength(250)]
    public string HeadPic { get; set; }

    public DateTime? Birthday { get; set; }

    [MaxLength(50)]
    public string College { get; set; }

    [MaxLength(50)]
    public string Grade { get; set; }

    [MaxLength(50)]
    public string Major { get; set; }

    [MaxLength(50)]
    public string Class { get; set; }

    [MaxLength(50)]
    public string Group { get; set; }

    [MaxLength(1)]
    public string StudentStatus { get; set; }




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
