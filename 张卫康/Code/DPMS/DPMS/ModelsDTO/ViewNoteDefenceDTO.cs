using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.ModelsDTO
{
  [Table("ViewNoteDefence")]
  public class ViewNoteDefenceDTO
  {

    public string DefenceId { get; set; }
    public string DefenceName { get; set; }
    public string Expr1 { get; set; }
    public string Problem { get; set; }
    public string Answer { get; set; }
    public string RealName { get; set; }

  }
}
