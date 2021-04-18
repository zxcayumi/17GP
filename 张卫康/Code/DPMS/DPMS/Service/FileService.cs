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
    /// 按文件编号查询文件信息（一个编号一个文件）
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

    /// <summary>
    /// 按文件名称查询文件信息（一个名称一个文件）
    /// </summary>
    /// <param name="fileName"></param>
    /// <returns></returns>
    public List<FileDTO> GetByFileName(string fileName)
    {
      IQueryable<File> list = db.Files.Where(c => c.FileName != null);
      if (!String.IsNullOrEmpty(fileName))
      {
        list = list.Where(c => c.FileName.Contains(fileName));
      }
      List<FileDTO> listDTO = new List<FileDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }


    /// <summary>
    /// 按学生学号查询文件信息（一个学号一个文件）
    /// </summary>
    /// <param name="stuId"></param>
    /// <returns></returns>
    public List<FileDTO> GetByStuId(String stuId)
    {
      IQueryable<File> list = db.Files.Where(c => c.StuId != null);
      if (!String.IsNullOrEmpty(stuId))
      {
        list = list.Where(c => c.StuId.Contains(stuId));
      }
      List<FileDTO> listDTO = new List<FileDTO>();
      mapper.Map(list.ToList(), listDTO);

      return listDTO;
    }

  }
}
