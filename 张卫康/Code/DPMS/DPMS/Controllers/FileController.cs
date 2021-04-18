using AutoMapper;
using DPMS.ModelsDTO;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace DPMS.Controllers
{
  [ApiController]
  [Route("File")]
  public class FileController : Controller
  {
    private IServices.IFileService s;
    private IMapper mapper;

    public FileController(IServices.IFileService s, IMapper mapper)
    {
      this.s = s;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加文件信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPost]
    public IActionResult Create(ModelsDTO.FileAddDTO model)
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
    /// 删除文件信息
    /// </summary>
    /// <param name="fileId"></param>
    /// <returns></returns>
    [HttpDelete]
    [Route("{fileId}")]
    public IActionResult Delete(String fileId)
    {
      Models.File model = new Models.File();
      model.FileId = fileId;

      if (s.Delete(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 查询文件信息
    /// </summary>
    /// <param name="fileId"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("{fileId}")]
    public IActionResult Get(String fileId)
    {
      ModelsDTO.FileDTO model = s.Get(fileId);

      if (model != null)
        return Ok(model);//200
      else
        return NotFound();//404
    }


    /// <summary>
    /// 按文件名查询文件信息
    /// </summary>
    /// <param name="fileName"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("FAll")]
    public IActionResult GetAll([FromQuery] String fileName)
    {
      try
      {
        List<FileDTO> models = s.GetByFileName(fileName);
        return Ok(models);
      }
      catch (Exception e)
      {
        return BadRequest(e);
      }
    }


    /// <summary>
    /// 查询学生学号查询文件信息
    /// </summary>
    /// <param name="stuId"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("Student/{stuId}")]
    public IActionResult GetByStuId(String stuId)
    {
      List<FileDTO> model = s.GetByStuId(stuId);

      if (model != null)
        return Ok(model);//200
      else
        return NotFound();//404
    }

  }
}
