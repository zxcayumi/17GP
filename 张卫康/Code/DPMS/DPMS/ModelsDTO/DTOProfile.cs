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

      CreateMap<Models.Defence, DefenceDTO>();
      CreateMap<DefenceUpdateDTO, Models.Defence>();
      CreateMap<DefenceAddDTO, Models.Defence>();

      CreateMap<Models.Defence, DefenceDTO>();
      CreateMap<DefenceUpdateDTO, Models.Defence>();
      CreateMap<DefenceAddDTO, Models.Defence>();

      CreateMap<Models.Defence, DefenceDTO>();
      CreateMap<DefenceUpdateDTO, Models.Defence>();
      CreateMap<DefenceAddDTO, Models.Defence>();

      CreateMap<Models.Defence, DefenceDTO>();
      CreateMap<DefenceUpdateDTO, Models.Defence>();
      CreateMap<DefenceAddDTO, Models.Defence>();

      CreateMap<Models.Defence, DefenceDTO>();
      CreateMap<DefenceUpdateDTO, Models.Defence>();
      CreateMap<DefenceAddDTO, Models.Defence>();

      CreateMap<Models.Defence, DefenceDTO>();
      CreateMap<DefenceUpdateDTO, Models.Defence>();
      CreateMap<DefenceAddDTO, Models.Defence>();

      CreateMap<Models.Defence, DefenceDTO>();
      CreateMap<DefenceUpdateDTO, Models.Defence>();
      CreateMap<DefenceAddDTO, Models.Defence>();
    }
  }
}

