using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using DPMS.IServices;
using DPMS.Models;
using DPMS.ModelsDTO;

namespace DPMS.Service
{
  public class FileService : IFileService
  {
    private DPMSContext db;
    private IMapper mapper;

    public FileService(DPMSContext db, IMapper mapper)
    {
      this.db = db;
      this.mapper = mapper;
    }

    /// <summary>
    /// 添加文件信息
    /// </summary>
    /// <param name="file"></param>
    /// <returns></returns>
    public Boolean Add(ModelsDTO.FileAddDTO file)
    {
      Models.File model = new Models.File();
      mapper.Map(file, model);//把c中的属性信息，对应到model中去
      db.Files.Add(model);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 删除文件信息
    /// </summary>
    /// <param name="file"></param>
    /// <returns></returns>
    public Boolean Delete(Models.File file)
    {
      db.Files.Remove(file);
      return db.SaveChanges() > 0 ? true : false;
    }

    /// <summary>
    /// 按文件编号查询文件信息
    /// </summary>
    /// <param name="File"></param>
    /// <returns></returns>
    public ModelsDTO.FileDTO Get(String File)
    {
      Models.File file = db.Files.SingleOrDefault(C => (C.FileId == File));
      ModelsDTO.FileDTO dto = new ModelsDTO.FileDTO();
      mapper.Map(file, dto);

      return dto;
    }

  }
}
