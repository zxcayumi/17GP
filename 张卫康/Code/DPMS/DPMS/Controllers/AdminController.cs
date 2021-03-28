using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;


namespace DPMS.Controllers
{
  [ApiController]
  [Route("[controller]")]
  public class AdminController : Controller
  {
    private IServices.IAdminService s;
    private IMapper mapper;

    public AdminController(IServices.IAdminService s, IMapper mapper)
    {
      this.s = s;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加管理员信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPost]
    public IActionResult Create(ModelsDTO.AdminAddDTO model)
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
    /// 更改管理员信息
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPut]
    public IActionResult Update(ModelsDTO.AdminUpdateDTO model)
    {
      if (s.Update(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 删除管理员信息
    /// </summary>
    /// <param name="adminId"></param>
    /// <returns></returns>
    [HttpDelete]
    [Route("{adminId}")]
    public IActionResult Delete(String adminId)
    {
      Models.Admin model = new Models.Admin();
      model.AdminId = adminId;

      if (s.Delete(model))
        return Ok();
      else
        return BadRequest();
    }

    /// <summary>
    /// 查询管理员信息
    /// </summary>
    /// <param name="adminId"></param>
    /// <returns></returns>
    [HttpGet]
    [Route("{courseID}")]
    public IActionResult Get(String adminId)
    {
      ModelsDTO.AdminDTO model = s.Get(adminId);

      if (model != null)
        return Ok(model);//200
      else
        return NotFound();//404
    }




  }
}
