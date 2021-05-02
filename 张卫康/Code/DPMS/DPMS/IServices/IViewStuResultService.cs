using DPMS.ModelsDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.IServices
{
  public interface IViewStuResultService
  {
    /// <summary>
    /// 按学号查询学生成绩信息
    /// </summary>
    /// <param name="stuID"></param>
    /// <returns></returns>
    List<ViewStuResultDTO> GetBystuID(String stuID);


    /// <summary>
    /// 按答辩名称查询答辩成绩信息
    /// </summary>
    /// <param name="defenceName"></param>
    /// <returns></returns>
    List<ViewStuResultDTO> GetBydefenceName(string defenceName);

  }
}
