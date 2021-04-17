using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.Controllers
{
  [ApiController]
  [Route("DefenceNote")]
  public class DefenceNoteController : Controller
  {
    private IServices.IDefenceNoteService s;
    private IMapper mapper;

    public DefenceNoteController(IServices.IDefenceNoteService s, IMapper mapper)
    {
      this.s = s;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加答辩记录信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPost]
    public IActionResult Create(ModelsDTO.DefenceNoteAddDTO model)
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
    /// 更改答辩记录信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPut]
    public IActionResult Update(ModelsDTO.DefenceNoteUpdateDTO model)
    {
      if (s.Update(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 删除答辩记录信息
    /// </summary>
    /// <param name="noteId"></param>
    /// <returns></returns>
    [HttpDelete]
    [Route("{noteId}")]
    public IActionResult Delete(String noteId)
    {
      Models.DefenceNote model = new Models.DefenceNote();
      model.NoteId= noteId;

      if (s.Delete(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 查询答辩记录信息
    /// </summary>
    /// <param name="noteId"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("{noteId}")]
    public IActionResult Get(String noteId)
    {
      ModelsDTO.DefenceNoteDTO model = s.Get(noteId);

      if (model != null)
        return Ok(model);//200
      else
        return NotFound();//404
    }
  }
}
