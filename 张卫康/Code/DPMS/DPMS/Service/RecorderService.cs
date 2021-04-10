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
  public class RecorderService : IRecorderService
  {

    private DPMSContext db;
    private IMapper mapper;

    public RecorderService(DPMSContext db, IMapper mapper)
    {
      this.db = db;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加记录员信息
    /// </summary>
    /// <param name="recorder"></param>
    /// <returns></returns>
    public Boolean Add(ModelsDTO.RecorderAddDTO recorder)
    {
      Models.Recorder model = new Models.Recorder();
      mapper.Map(recorder, model);//把c中的属性信息，对应到model中去
      db.Recorders.Add(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 删除记录员身份信息
    /// </summary>
    /// <param name="recorder"></param>
    /// <returns></returns>
    public Boolean Delete(Models.Recorder recorder)
    {
      db.Recorders.Remove(recorder);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 修改记录员身份信息
    /// </summary>
    /// <param name="recorder"></param>
    /// <returns></returns>
    public Boolean Update(ModelsDTO.RecorderUpdateDTO recorder)
    {
      Models.Recorder model = db.Recorders.FirstOrDefault(obj => obj.RecorderId == recorder.RecorderId);
      mapper.Map(recorder, model);//把c中的属性信息，对应到model中去

      db.Recorders.Update(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 按记录员编号查询记录员信息
    /// </summary>
    /// <param name="Recorder"></param>
    /// <returns></returns>
    public ModelsDTO.RecorderDTO Get(String Recorder)
    {
      Models.Recorder recorder = db.Recorders.SingleOrDefault(C => (C.RecorderId == Recorder));
      ModelsDTO.RecorderDTO dto = new ModelsDTO.RecorderDTO();
      mapper.Map(recorder, dto);

      return dto;
    }

    /// <summary>
    /// 按记录员姓名查询记录员信息
    /// </summary>
    /// <param name="realName"></param>
    /// <returns></returns>
    public List<RecorderDTO> GetByRecorderName(string realName)
    {
      IQueryable<Recorder> list = db.Recorders.Where(c => c.RecorderId != null);
      if (!String.IsNullOrEmpty(realName))
      {
        list = list.Where(c => c.RealName.Contains(realName));
      }
      List<RecorderDTO> listDTO = new List<RecorderDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }

  }
}
