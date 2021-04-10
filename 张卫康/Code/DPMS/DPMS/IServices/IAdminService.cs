using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.IServices
{
  public interface IAdminService
  {

    Boolean Add(ModelsDTO.AdminAddDTO c);

    Boolean Update(ModelsDTO.AdminUpdateDTO c);

    Boolean Delete(Models.Admin c);

    ModelsDTO.AdminDTO Get(String courseID);
  }
}
