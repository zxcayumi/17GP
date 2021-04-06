using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.Controllers
{
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
  }
}
