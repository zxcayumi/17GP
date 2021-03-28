using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.IServices
{
  public interface ITeacherService
  {
    Boolean Add(ModelsDTO.TeacherAddDTO c);

    Boolean Update(ModelsDTO.TeacherUpdateDTO c);

    Boolean Delete(Models.Teacher c);

    ModelsDTO.TeacherDTO Get(String teacher);
  }
}
