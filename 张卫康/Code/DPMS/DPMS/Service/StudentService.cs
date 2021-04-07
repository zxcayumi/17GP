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
  public class StudentService : IStudentService
  {

    private DPMSContext db;
    private IMapper mapper;

    public StudentService(DPMSContext db, IMapper mapper)
    {
      this.db = db;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加学生信息
    /// </summary>
    /// <param name="student"></param>
    /// <returns></returns>
    public Boolean Add(ModelsDTO.StudentAddDTO student)
    {
      Models.Student model = new Models.Student();
      mapper.Map(student, model);//把c中的属性信息，对应到model中去
      db.Students.Add(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 删除学生信息
    /// </summary>
    /// <param name="student"></param>
    /// <returns></returns>
    public Boolean Delete(Models.Student student)
    {
      db.Students.Remove(student);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 修改学生信息
    /// </summary>
    /// <param name="student"></param>
    /// <returns></returns>
    public Boolean Update(ModelsDTO.StudentUpdateDTO student)
    {
      Models.Student model = db.Students.FirstOrDefault(obj => obj.StuId == student.StuId);
      mapper.Map(student, model);//把c中的属性信息，对应到model中去

      db.Students.Update(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 按学号查询学生信息
    /// </summary>
    /// <param name="student"></param>
    /// <returns></returns>
    public ModelsDTO.StudentDTO Get(String student)
    {
      Models.Student stu  = db.Students.SingleOrDefault(C => (C.StuId == student));
      ModelsDTO.StudentDTO dto = new ModelsDTO.StudentDTO();
      mapper.Map(stu, dto);

      return dto;
    }

    /// <summary>
    /// 按学生姓名查询学生信息
    /// </summary>
    /// <param name="realName"></param>
    /// <returns></returns>
    public List<StudentDTO> GetByStudentName(string realName)
    {
      IQueryable<Student> list = db.Students.Where(c => c.StuId != null);
      if (!String.IsNullOrEmpty(realName))
      {
        list = list.Where(c => c.RealName.Contains(realName));
      }
      List<StudentDTO> listDTO = new List<StudentDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }

  }
}
