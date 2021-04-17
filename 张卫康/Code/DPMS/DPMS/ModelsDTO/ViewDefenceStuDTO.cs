using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace DPMS.ModelsDTO
{
  [Table("ViewDefenceStu")]
  public class ViewDefenceStuDTO
  {
    public string DefenceId { get; set; }
    public string DefenceName { get; set; }
    public string Method { get; set; }
    public string Outline { get; set; }
    public string WorkSatus { get; set; }
    public string RealName { get; set; }
    public string StuId { get; set; }
  }
}
