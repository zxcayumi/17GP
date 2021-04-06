using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.Controllers
{
  [ApiController]
  [Route("[controller]")]
  public class DefenceResultController : Controller 
  {
    private IServices.IDefenceResultService s;
    private IMapper mapper;

    public DefenceResultController(IServices.IDefenceResultService s, IMapper mapper)
    {
      this.s = s;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加答辩结果信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPost]
    public IActionResult Create(ModelsDTO.DefenceResultAddDTO model)
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
    /// 更改答辩结果信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPut]
    public IActionResult Update(ModelsDTO.DefenceResultUpdateDTO model)
    {
      if (s.Update(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 删除答辩结果信息
    /// </summary>
    /// <param name="resultId"></param>
    /// <returns></returns>
    [HttpDelete]
    [Route("{resultId}")]
    public IActionResult Delete(String resultId)
    {
      Models.DefenceResult model = new Models.DefenceResult();
      model.ResultId = resultId;

      if (s.Delete(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 查询答辩结果信息
    /// </summary>
    /// <param name="resultId"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("{resultId}")]
    public IActionResult Get(String resultId)
    {
      ModelsDTO.DefenceResultDTO model = s.Get(resultId);

      if (model != null)
        return Ok(model);//200
      else
        return NotFound();//404
    }
  }
}
