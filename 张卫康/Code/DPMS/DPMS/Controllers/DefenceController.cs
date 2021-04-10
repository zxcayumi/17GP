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
  [Route("[controller]")]

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

    [HttpDelete]
    [Route("{defenceId}")]
    public IActionResult Delete(String defenceId)
    {
      Models.Defence model = new Models.Defence();
      model.DefenceId = defenceId;

      if (s.Delete(model))
        return Ok();
      else
        return BadRequest();
    }

  }
}
