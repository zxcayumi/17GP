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
  public class ViewDefenceStuService : IViewDefenceStuService
  {
    private DPMSContext db;
    private IMapper mapper;

    public ViewDefenceStuService(DPMSContext db, IMapper mapper)
    {
      this.db = db;
      this.mapper = mapper;
    }


    /// <summary>
    /// 按答辩编号查询答辩信息
    /// </summary>
    /// <param name="defenceId"></param>
    /// <returns></returns>
    public List<ViewDefenceStuDTO> GetDefenceList(String defenceId)
    {
      IQueryable<ViewDefenceStu> list = db.ViewDefenceStus.Where(c => c.DefenceID != null);
      if (!String.IsNullOrEmpty(defenceId))
      {
        list = list.Where(c => c.DefenceID.Contains(defenceId));
      }
      List<ViewDefenceStuDTO> listDTO = new List<ViewDefenceStuDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }

    /// <summary>
    /// 按答辩名称查询答辩信息
    /// </summary>
    /// <param name="defenceName"></param>
    /// <returns></returns>
    public List<ViewDefenceStuDTO> GetBydefenceName(string defenceName)
    {
      IQueryable<ViewDefenceStu> list = db.ViewDefenceStus.Where(c => c.DefenceID != null);
      if (!String.IsNullOrEmpty(defenceName))
      {
        list = list.Where(c => c.DefenceName.Contains(defenceName));
      }
      List<ViewDefenceStuDTO> listDTO = new List<ViewDefenceStuDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }



  }
}
