using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.IServices
{
  public interface IDefenceResultService
  {
    Boolean Add(ModelsDTO.DefenceResultAddDTO c);

    Boolean Update(ModelsDTO.DefenceResultUpdateDTO c);

    Boolean Delete(Models.DefenceResult c);

    ModelsDTO.DefenceResultDTO Get(String DefenceResult);
  }
}
