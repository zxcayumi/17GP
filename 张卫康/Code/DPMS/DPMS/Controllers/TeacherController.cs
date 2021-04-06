using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.Controllers
{
  public class TeacherController : Controller
  {
    private IServices.ITeacherService s;
    private IMapper mapper;

    public TeacherController(IServices.ITeacherService s, IMapper mapper)
    {
      this.s = s;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加教师信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPost]
    public IActionResult Create(ModelsDTO.TeacherAddDTO model)
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
    /// 更改教师信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPut]
    public IActionResult Update(ModelsDTO.TeacherUpdateDTO model)
    {
      if (s.Update(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 删除教师信息
    /// </summary>
    /// <param name="teachId"></param>
    /// <returns></returns>
    [HttpDelete]
    [Route("{teachId}")]
    public IActionResult Delete(String teachId)
    {
      Models.Teacher model = new Models.Teacher();
      model.TeachId = teachId;

      if (s.Delete(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 查询教师信息
    /// </summary>
    /// <param name="teachId"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("{teachId}")]
    public IActionResult Get(String teachId)
    {
      ModelsDTO.TeacherDTO model = s.Get(teachId);

      if (model != null)
        return Ok(model);//200
      else
        return NotFound();//404
    }
  }
}
