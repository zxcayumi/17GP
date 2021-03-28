using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DPMS.ModelsDTO;

namespace DPMS.IServices
{
  public interface IDefenceService
  {
    Boolean Add(ModelsDTO.DefenceAddDTO c);

    Boolean Update(ModelsDTO.DefenceUpdateDTO c);

    Boolean Delete(Models.Defence c);

    ModelsDTO.DefenceDTO Get(String defence);
  }
}
