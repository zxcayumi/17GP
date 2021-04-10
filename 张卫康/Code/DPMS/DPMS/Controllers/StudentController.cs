using AutoMapper;
using DPMS.ModelsDTO;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.Controllers
{
  public class StudentController : Controller
  {
    private IServices.IStudentService s;
    private IMapper mapper;

    public StudentController(IServices.IStudentService s, IMapper mapper)
    {
      this.s = s;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加学生信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPost]
    public IActionResult Create(ModelsDTO.StudentAddDTO model)
    {
      try
      {
        s.Add(model);
        return Ok();
      }
      catch (Exception ex)
      {
        return BadRequest(ex.ToString());
      }
    }

    /// <summary>
    /// 更改学生信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPut]
    public IActionResult Update(ModelsDTO.StudentUpdateDTO model)
    {
      if (s.Update(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 删除学生信息
    /// </summary>
    /// <param name="stuId"></param>
    /// <returns></returns>
    [HttpDelete]
    [Route("{stuId}")]
    public IActionResult Delete(String stuId)
    {
      Models.Student model = new Models.Student();
      model.StuId = stuId;

      if (s.Delete(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 查询学生信息
    /// </summary>
    /// <param name="stuId"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("{stuId}")]
    public IActionResult Get(String stuId)
    {
      ModelsDTO.StudentDTO model = s.Get(stuId);

      if (model != null)
        return Ok(model);//200
      else
        return NotFound();//404
    }

    /// <summary>
    /// 按学生姓名查询学生信息
    /// </summary>
    /// <param name="realName"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("SAll")]
    public IActionResult GetAll([FromQuery] String realName)
    {
      try
      {
        List<StudentDTO> models = s.GetByStudentName(realName);
        return Ok(models);
      }
      catch (Exception e)
      {
        return BadRequest(e);
      }
    }
  }
}
