using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.ModelsDTO
{
  public class DTOProfile : Profile
  {
    public DTOProfile()
    {
      //数据由数据库运往前端为<文件DTO，文件>
      //数据由前端运往数据库为<文件，文件DTO>

      CreateMap<Models.Admin, AdminDTO>();
      CreateMap<AdminUpdateDTO, Models.Admin>();
      CreateMap<AdminAddDTO, Models.Admin>();

      CreateMap<Models.Defence, DefenceDTO>();
      CreateMap<DefenceUpdateDTO,Models.Defence>();
      CreateMap<DefenceAddDTO,Models.Defence>();

      CreateMap<Models.DefenceNote, DefenceNoteDTO>();
      CreateMap<DefenceNoteUpdateDTO, Models.DefenceNote>();
      CreateMap<DefenceNoteAddDTO, Models.DefenceNote>();

      CreateMap<Models.DefenceResult, DefenceResultDTO>();
      CreateMap<DefenceResultUpdateDTO, Models.DefenceResult>();
      CreateMap<DefenceResultAddDTO, Models.DefenceResult>();

      CreateMap<Models.File, FileDTO>();
      CreateMap<FileUpdateDTO, Models.File>();
      CreateMap<FileAddDTO, Models.File>();

      CreateMap<Models.Recorder, RecorderDTO>();
      CreateMap<RecorderUpdateDTO, Models.Recorder>();
      CreateMap<RecorderAddDTO, Models.Recorder>();

      CreateMap<Models.Student, StudentDTO>();
      CreateMap<StudentUpdateDTO, Models.Student>();
      CreateMap<StudentAddDTO, Models.Student>();

      CreateMap<Models.Teacher, TeacherDTO>();
      CreateMap<TeacherUpdateDTO, Models.Teacher>();
      CreateMap<TeacherAddDTO, Models.Teacher>();

      CreateMap<Models.ViewDefenceStu, ViewDefenceStuDTO>();
      CreateMap<Models.ViewNoteDefence, ViewNoteDefenceDTO>();
      CreateMap<Models.ViewStuResult, ViewStuResultDTO>();


    }
  }
}

