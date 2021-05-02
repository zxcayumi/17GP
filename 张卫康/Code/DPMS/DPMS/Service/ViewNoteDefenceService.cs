using DPMS.IServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DPMS.Models;
using AutoMapper;
using DPMS.ModelsDTO;

namespace DPMS.Service
{
  public class ViewNoteDefenceService : IViewNoteDefenceService
  {
    private DPMSContext db;
    private IMapper mapper;

    public ViewNoteDefenceService(DPMSContext db, IMapper mapper)
    {
      this.db = db;
      this.mapper = mapper;
    }

    /// <summary>
    /// 按答辩编号查询答辩记录信息
    /// </summary>
    /// <param name="defenceId"></param>
    /// <returns></returns>
    public List<ViewNoteDefenceDTO> GetBydefenceId(String defenceId)
    {
      IQueryable<ViewNoteDefence> list = db.ViewNoteDefences.Where(c => c.DefenceId != null);
      if (!String.IsNullOrEmpty(defenceId))
      {
        list = list.Where(c => c.DefenceId.Contains(defenceId));
      }
      List<ViewNoteDefenceDTO> listDTO = new List<ViewNoteDefenceDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }

    /// <summary>
    /// 按答辩名称查询答辩记录信息
    /// </summary>
    /// <param name="defenceName"></param>
    /// <returns></returns>
    public List<ViewNoteDefenceDTO> GetBydefenceName(string defenceName)
    {
      IQueryable<ViewNoteDefence> list = db.ViewNoteDefences.Where(c => c.DefenceId != null);
      if (!String.IsNullOrEmpty(defenceName))
      {
        list = list.Where(c => c.DefenceName.Contains(defenceName));
      }
      List<ViewNoteDefenceDTO> listDTO = new List<ViewNoteDefenceDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }

  }
}
