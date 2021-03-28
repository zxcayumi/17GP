using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using DPMS.IServices;
using DPMS.Models;
using DPMS.ModelsDTO;

namespace DPMS.Service
{
  public class DefenceService : IDefenceService
  {
    private DPMSContext db;
    private IMapper mapper;

    public DefenceService(DPMSContext db, IMapper mapper)
    {
      this.db = db;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加答辩作品信息
    /// </summary>
    /// <param name="defence"></param>
    /// <returns></returns>
    public Boolean Add(ModelsDTO.DefenceAddDTO defence)
    {
      Models.Defence model = new Models.Defence();
      mapper.Map(defence, model);//把c中的属性信息，对应到model中去
      db.Defences.Add(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 删除答辩作品信息
    /// </summary>
    /// <param name="defence"></param>
    /// <returns></returns>
    public Boolean Delete(Models.Defence defence)
    {
      db.Defences.Remove(defence);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 修改答辩作品信息
    /// </summary>
    /// <param name="defence"></param>
    /// <returns></returns>
    public Boolean Update(ModelsDTO.DefenceUpdateDTO defence)
    {
      Models.Defence model = db.Defences.FirstOrDefault(obj => obj.DefenceId == defence.DefenceId);
      mapper.Map(defence, model);//把c中的属性信息，对应到model中去

      db.Defences.Update(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 按答辩作品编号查询答辩作品信息
    /// </summary>
    /// <param name="defence"></param>
    /// <returns></returns>
    public ModelsDTO.DefenceDTO Get(String defenceid)
    {
      Models.Defence defence = db.Defences.SingleOrDefault(C => (C.DefenceId == defenceid));
      ModelsDTO.DefenceDTO dto = new ModelsDTO.DefenceDTO();
      mapper.Map(defence, dto);

      return dto;
    }



  }
}
