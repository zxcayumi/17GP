using AutoMapper;
using DPMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DPMS.IServices;

namespace DPMS.Service
{
  public class AdminService : IAdminService
  {
    private DPMSContext db;
    private IMapper mapper;

    public AdminService(DPMSContext db, IMapper mapper)
    {
      this.db = db;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加管理员信息
    /// </summary>
    /// <param name="admin"></param>
    /// <returns></returns>
    public Boolean Add(ModelsDTO.AdminAddDTO admin)
    {
      Models.Admin model = new Models.Admin();
      mapper.Map(admin, model);//把c中的属性信息，对应到model中去
      db.Admins.Add(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 删除管理员信息
    /// </summary>
    /// <param name="admin"></param>
    /// <returns></returns>
    public Boolean Delete(Models.Admin admin)
    {
      db.Admins.Remove(admin);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 修改管理员信息
    /// </summary>
    /// <param name="admin"></param>
    /// <returns></returns>
    public Boolean Update(ModelsDTO.AdminUpdateDTO admin)
    {
      Models.Admin model = db.Admins.FirstOrDefault(obj => obj.AdminId == admin.AdminId);
      mapper.Map(admin, model);//把c中的属性信息，对应到model中去

      db.Admins.Update(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 按答辩作品编号查询管理员信息
    /// </summary>
    /// <param name="admin"></param>
    /// <returns></returns>
    public ModelsDTO.AdminDTO Get(String Admin)
    {
      Models.Admin admin = db.Admins.SingleOrDefault(C => (C.AdminId == Admin));
      ModelsDTO.AdminDTO dto = new ModelsDTO.AdminDTO();
      mapper.Map(admin, dto);

      return dto;
    }



  }
}
