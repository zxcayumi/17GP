using AutoMapper;
using DPMS.IServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DPMS.Models;
using DPMS.ModelsDTO;

namespace DPMS.Service
{
  public class DefenceResultService : IDefenceResultService
  {

    private DPMSContext db;
    private IMapper mapper;

    public DefenceResultService(DPMSContext db, IMapper mapper)
    {
      this.db = db;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加答辩结果信息
    /// </summary>
    /// <param name="defenceResult"></param>
    /// <returns></returns>
    public Boolean Add(ModelsDTO.DefenceResultAddDTO defenceResult)
    {
      Models.DefenceResult model = new Models.DefenceResult();
      mapper.Map(defenceResult, model);//把c中的属性信息，对应到model中去
      db.DefenceResults.Add(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 删除答辩结果信息
    /// </summary>
    /// <param name="defenceResult"></param>
    /// <returns></returns>
    public Boolean Delete(Models.DefenceResult defenceResult)
    {
      db.DefenceResults.Remove(defenceResult);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 修改答辩结果信息
    /// </summary>
    /// <param name="defenceResult"></param>
    /// <returns></returns>
    public Boolean Update(ModelsDTO.DefenceResultUpdateDTO defenceResult)
    {
      Models.DefenceResult model = db.DefenceResults.FirstOrDefault(obj => obj.ResultId == defenceResult.ResultId);
      mapper.Map(defenceResult, model);//把c中的属性信息，对应到model中去

      db.DefenceResults.Update(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 按答辩结果编号查询答辩结果信息
    /// </summary>
    /// <param name="DefenceResult"></param>
    /// <returns></returns>
    public ModelsDTO.DefenceResultDTO Get(String DefenceResult)
    {
      Models.DefenceResult defenceResult = db.DefenceResults.SingleOrDefault(C => (C.ResultId == DefenceResult));
      ModelsDTO.DefenceResultDTO dto = new ModelsDTO.DefenceResultDTO();
      mapper.Map(defenceResult, dto);

      return dto;
    }


    /// <summary>
    /// 按教师编号查询答辩结果信息（一个教师可以为多个学生打分）
    /// </summary>
    /// <param name="teachId"></param>
    /// <returns></returns>
    public List<DefenceResultDTO> GetByTeachId(string teachId)
    {
      IQueryable<DefenceResult> list = db.DefenceResults.Where(c => c.TeachId != null);
      if (!String.IsNullOrEmpty(teachId))
      {
        list = list.Where(c => c.TeachId.Contains(teachId));
      }
      List<DefenceResultDTO> listDTO = new List<DefenceResultDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }

    /// <summary>
    /// 按学生学号查询答辩结果信息(一个学生一个结果信息）
    /// </summary>
    /// <param name="stuId"></param>
    /// <returns></returns>
    public ModelsDTO.DefenceResultDTO GetByStuId(String stuId)
    {
      Models.DefenceResult defenceResult = db.DefenceResults.SingleOrDefault(C => (C.StuId == stuId));
      ModelsDTO.DefenceResultDTO dto = new ModelsDTO.DefenceResultDTO();
      mapper.Map(defenceResult, dto);

      return dto;
    }

  }
}
