using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DPMS.ModelsDTO;

namespace DPMS.Controllers
{
  [ApiController]
  [Route("DefenceResult")]
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


    /// <summary>
    /// 按教师编号查询答辩结果信息（一个教师可以为多个学生打分）
    /// </summary>
    /// <param name="teachId"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("DAll/{teachId}")]
    public IActionResult GetAll([FromQuery] String teachId)
    {
      try
      {
        List<DefenceResultDTO> models = s.GetByTeachId(teachId);
        return Ok(models);
      }
      catch (Exception e)
      {
        return BadRequest(e);
      }
    }

    /// <summary>
    /// 按学生学号查询文件信息(一个学号一条信息）
    /// </summary>
    /// <param name="stuId"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("Result/{stuId}")]
    public IActionResult GetByStuId(String stuId)
    {
      ModelsDTO.DefenceResultDTO model = s.GetByStuId(stuId);

      if (model != null)
        return Ok(model);//200
      else
        return NotFound();//404
    }


  }
}
