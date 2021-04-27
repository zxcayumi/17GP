using AutoMapper;
using DPMS.IServices;
using DPMS.Models;
using DPMS.ModelsDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.Service
{
  public class ViewStuResultService : IViewStuResultService
  {
    private DPMSContext db;
    private IMapper mapper;

    public ViewStuResultService(DPMSContext db, IMapper mapper)
    {
      this.db = db;
      this.mapper = mapper;
    }

    /// <summary>
    /// 按学号查询学生成绩信息
    /// </summary>
    /// <param name="stuID"></param>
    /// <returns></returns>
    public List<ViewStuResultDTO> GetBystuID(String stuID)
    {
      IQueryable<ViewStuResult> list = db.ViewStuResults.Where(c => c.ResultId != null);
      if (!String.IsNullOrEmpty(stuID))
      {
        list = list.Where(c => c.StuId.Contains(stuID));
      }
      List<ViewStuResultDTO> listDTO = new List<ViewStuResultDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }

    /// <summary>
    /// 按答辩名称查询答辩成绩信息
    /// </summary>
    /// <param name="defenceName"></param>
    /// <returns></returns>
    public List<ViewStuResultDTO> GetBydefenceName(string defenceName)
    {
      IQueryable<ViewStuResult> list = db.ViewStuResults.Where(c => c.ResultId != null);
      if (!String.IsNullOrEmpty(defenceName))
      {
        list = list.Where(c => c.DefenceName.Contains(defenceName));
      }
      List<ViewStuResultDTO> listDTO = new List<ViewStuResultDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }

  }
}
