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
  public class TeacherService : ITeacherService
  {
    private DPMSContext db;
    private IMapper mapper;

    public TeacherService(DPMSContext db, IMapper mapper)
    {
      this.db = db;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加老师信息
    /// </summary>
    /// <param name="teacher"></param>
    /// <returns></returns>
    public Boolean Add(ModelsDTO.TeacherAddDTO teacher)
    {
      Models.Teacher model = new Models.Teacher();
      mapper.Map(teacher, model);//把c中的属性信息，对应到model中去
      db.Teachers.Add(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 删除老师信息
    /// </summary>
    /// <param name="teacher"></param>
    /// <returns></returns>
    public Boolean Delete(Models.Teacher teacher)
    {
      db.Teachers.Remove(teacher);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 修改老师信息
    /// </summary>
    /// <param name="student"></param>
    /// <returns></returns>
    public Boolean Update(ModelsDTO.TeacherUpdateDTO teacher)
    {
      Models.Teacher model = db.Teachers.FirstOrDefault(obj => obj.TeachId == teacher.TeachId);
      mapper.Map(teacher, model);//把c中的属性信息，对应到model中去

      db.Teachers.Update(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 按工号查询老师信息
    /// </summary>
    /// <param name="teachId"></param>
    /// <returns></returns>
    public ModelsDTO.TeacherDTO Get(String teachId)
    {
      Models.Teacher stu = db.Teachers.SingleOrDefault(C => (C.TeachId == teachId));
      ModelsDTO.TeacherDTO dto = new ModelsDTO.TeacherDTO();
      mapper.Map(stu, dto);

      return dto;
    }

    /// <summary>
    /// 按教师姓名查询教师信息
    /// </summary>
    /// <param name="teachName"></param>
    /// <returns></returns>
    public List<TeacherDTO> GetByTeacherName(string teachID, string realName)
    {
      IQueryable<Teacher> list = db.Teachers.Where(c => c.TeachId == teachID);
      if (!String.IsNullOrEmpty(realName))
      {
        list = list.Where(c => c.TeachId.Contains(teachID));
      }
      List<TeacherDTO> listDTO = new List<TeacherDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }

  }
}
