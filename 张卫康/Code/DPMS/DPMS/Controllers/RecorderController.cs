using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.Controllers
{
  [ApiController]
  [Route("[Controller]")]
  public class RecorderController : Controller
  {
    private IServices.IRecorderService s;
    private IMapper mapper;

    public RecorderController(IServices.IRecorderService s, IMapper mapper)
    {
      this.s = s;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加记录员信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPost]
    public IActionResult Create(ModelsDTO.RecorderAddDTO model)
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
    /// 更改记录员信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPut]
    public IActionResult Update(ModelsDTO.RecorderUpdateDTO model)
    {
      if (s.Update(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 删除记录员信息
    /// </summary>
    /// <param name="recorderId"></param>
    /// <returns></returns>
    [HttpDelete]
    [Route("{adminId}")]
    public IActionResult Delete(String recorderId)
    {
      Models.Recorder model = new Models.Recorder();
      model.RecorderId = recorderId;

      if (s.Delete(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 查询记录员信息
    /// </summary>
    /// <param name="recorderId"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("{recorderId}")]
    public IActionResult Get(String recorderId)
    {
      ModelsDTO.RecorderDTO model = s.Get(recorderId);

      if (model != null)
        return Ok(model);//200
      else
        return NotFound();//404
    }
  }
}
