using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace DPMS.Models
{
  [Table("ViewDefenceStu")]

  public partial class ViewDefenceStu
    {
        public string DefenceID { get; set; }
        public string DefenceName { get; set; }
        public string Method { get; set; }
        public string Outline { get; set; }
        public string WorkSatus { get; set; }
        public string RealName { get; set; }
        public string StuId { get; set; }
        public string GuideTeacher { get; set; }
  }
}
