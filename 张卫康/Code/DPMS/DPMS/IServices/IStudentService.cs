using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.IServices
{
  public interface IStudentService
  {
    Boolean Add(ModelsDTO.StudentAddDTO c);

    Boolean Update(ModelsDTO.StudentUpdateDTO c);

    Boolean Delete(Models.Student c);

    ModelsDTO.StudentDTO Get(String student);
  }
}
