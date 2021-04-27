using DPMS.ModelsDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.IServices
{
  public interface IViewNoteDefenceService
  {
    /// <summary>
    /// 按答辩编号查询答辩记录信息
    /// </summary>
    /// <param name="defenceId"></param>
    /// <returns></returns>
    List<ViewNoteDefenceDTO> GetBydefenceId(String defenceId);


    /// <summary>
    /// 按答辩名称查询答辩记录信息
    /// </summary>
    /// <param name="defenceName"></param>
    /// <returns></returns>
    List<ViewNoteDefenceDTO> GetBydefenceName(string defenceName);

  }
}
