using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.IServices
{
  public interface IFileService
  {
    Boolean Add(ModelsDTO.FileAddDTO c);

    Boolean Delete(Models.File c);

    ModelsDTO.FileDTO Get(String File);
  }
}
