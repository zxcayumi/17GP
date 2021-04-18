using AutoMapper;
using DPMS.ModelsDTO;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.Controllers
{
  [ApiController]
  [Route("ViewNoteDefence")]
  public class ViewNoteDefenceController : Controller 
  {
    private IServices.IViewNoteDefenceService s;
    private IMapper mapper;

    public ViewNoteDefenceController(IServices.IViewNoteDefenceService s, IMapper mapper)
    {
      this.s = s;
      this.mapper = mapper;
    }

    /// <summary>
    /// 查询学生学号查询文件信息
    /// </summary>
    /// <param name="defenceName"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("All/{defenceId}")]
    public IActionResult GetBydefenceId(String defenceId)
    {
      List<ViewNoteDefenceDTO> model = s.GetBydefenceId(defenceId);

      if (model != null)
        return Ok(model);//200
      else
        return NotFound();//404
    }


    /// <summary>
    /// 按答辩名称查询答辩信息
    /// </summary>
    /// <param name="defenceName"></param>
    /// <returns></returns>
    ///
    [HttpGet]
    [Route("VAll")]
    public IActionResult GetAll([FromQuery] String defenceName)
    {
      try
      {
        List<ViewNoteDefenceDTO> models = s.GetBydefenceName(defenceName);
        return Ok(models);
      }
      catch (Exception e)
      {
        return BadRequest(e);
      }
    }


  }
}
