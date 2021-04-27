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
  [Route("ViewStuResult")]
  public class ViewStuResultController : Controller 
  {
    private IServices.IViewStuResultService s;
    private IMapper mapper;

    public ViewStuResultController(IServices.IViewStuResultService s, IMapper mapper)
    {
      this.s = s;
      this.mapper = mapper;
    }

    /// <summary>
    /// 查询学生学号查询文件信息
    /// </summary>
    /// <param name="stuID"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("All/{stuID}")]
    public IActionResult GetBydefenceId(String stuID)
    {
      List<ViewStuResultDTO> model = s.GetBystuID(stuID);

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
        List<ViewStuResultDTO> models = s.GetBydefenceName(defenceName);
        return Ok(models);
      }
      catch (Exception e)
      {
        return BadRequest(e);
      }
    }
  }
}
