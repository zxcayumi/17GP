using DPMS.ModelsDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.IServices
{
  public interface IRecorderService
  {

    Boolean Add(ModelsDTO.RecorderAddDTO c);

    Boolean Update(ModelsDTO.RecorderUpdateDTO c);

    Boolean Delete(Models.Recorder c);

    ModelsDTO.RecorderDTO Get(String Recorder);

    List<RecorderDTO> GetByRecorderName(string realName);
  }
}
