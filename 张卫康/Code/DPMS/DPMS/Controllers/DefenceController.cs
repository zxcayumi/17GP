using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using DPMS.ModelsDTO;
using DPMS.Models;
using System.Text.Json;


namespace DPMS.Controllers
{
  [ApiController]
  [Route("[Controller]")]

  public class DefenceController : Controller
  {
    //CourseService类负责与数据库打交道
    private IServices.IDefenceService s;
    private IMapper mapper;

    public DefenceController(IServices.IDefenceService s, IMapper mapper)
    {
      this.s = s;
      this.mapper = mapper;
    }


    //[HttpPost]
    //public IActionResult Create(ModelsDTO.DefenceAddDTO model)
    //{
    //  try
    //  {
    //    s.Add(model);
    //    return Ok();
    //  }
    //  catch (Exception ex)
    //  {
    //    return BadRequest(ex.ToString());
    //  }
    //}

    //[HttpDelete]
    //[Route("{defenceId}")]
    //public IActionResult Delete(String defenceId)
    //{
    //  Models.Defence model = new Models.Defence();
    //  model.DefenceId = defenceId;

    //  if (s.Delete(model))
    //    return Ok();
    //  else
    //    return BadRequest();
    //}



    /// <summary>
    /// 添加答辩作品信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPost]
    public IActionResult Create(ModelsDTO.DefenceAddDTO model)
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
    /// 更改答辩作品信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPut]
    public IActionResult Update(ModelsDTO.DefenceUpdateDTO model)
    {
      if (s.Update(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 删除答辩作品信息
    /// </summary>
    /// <param name="denfenceId"></param>
    /// <returns></returns>
    [HttpDelete]
    [Route("{denfenceId}")]
    public IActionResult Delete(String denfenceId)
    {
      Models.Defence model = new Models.Defence();
      model.DefenceId = denfenceId;

      if (s.Delete(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 查询答辩作品信息信息
    /// </summary>
    /// <param name="denfenceId"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("{denfenceId}")]
    public IActionResult Get(String denfenceId)
    {
      ModelsDTO.DefenceDTO model = s.Get(denfenceId);

      if (model != null)
        return Ok(model);//200
      else
        return NotFound();//404
    }
  }
}
