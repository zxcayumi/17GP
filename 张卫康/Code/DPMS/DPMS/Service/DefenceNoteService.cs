using AutoMapper;
using DPMS.IServices;
using DPMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.Service
{
  public class DefenceNoteService : IDefenceNoteService
  {
    private DPMSContext db;
    private IMapper mapper;

    public DefenceNoteService(DPMSContext db, IMapper mapper)
    {
      this.db = db;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加答辩记录信息
    /// </summary>
    /// <param name="defenceNote"></param>
    /// <returns></returns>
    public Boolean Add(ModelsDTO.DefenceNoteAddDTO defenceNote)
    {
      Models.DefenceNote model = new Models.DefenceNote();
      mapper.Map(defenceNote, model);//把c中的属性信息，对应到model中去
      db.DefenceNotes.Add(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 删除答辩记录信息
    /// </summary>
    /// <param name="defenceNote"></param>
    /// <returns></returns>
    public Boolean Delete(Models.DefenceNote defenceNote)
    {
      db.DefenceNotes.Remove(defenceNote);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 修改答辩记录信息
    /// </summary>
    /// <param name="defenceNote"></param>
    /// <returns></returns>
    public Boolean Update(ModelsDTO.DefenceNoteUpdateDTO defenceNote)
    {
      Models.DefenceNote model = db.DefenceNotes.FirstOrDefault(obj => obj.NoteId == defenceNote.NoteId);
      mapper.Map(defenceNote, model);//把c中的属性信息，对应到model中去

      db.DefenceNotes.Update(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 按答辩作品编号查询答辩记录信息（一个编号一个结果）
    /// </summary>
    /// <param name="defenceNoteId"></param>
    /// <returns></returns>
    public ModelsDTO.DefenceNoteDTO Get(String DefenceNoteId)
    {
      Models.DefenceNote defence = db.DefenceNotes.SingleOrDefault(C => (C.NoteId == DefenceNoteId));
      ModelsDTO.DefenceNoteDTO dto = new ModelsDTO.DefenceNoteDTO();
      mapper.Map(defence, dto);

      return dto;
    }

  }
}
