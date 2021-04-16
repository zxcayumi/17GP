using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace DPMS.Models
{
  [Table("ViewNoteDefence")]

  public partial class ViewNoteDefence
    {
        public string DefenceId { get; set; }
        public string DefenceName { get; set; }
        public string Expr1 { get; set; }
        public string Problem { get; set; }
        public string Answer { get; set; }
        public string RealName { get; set; }
    }
}
