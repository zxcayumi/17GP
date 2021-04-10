using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DPMS.IServices
{
  public interface IDefenceNoteService
  {
    Boolean Add(ModelsDTO.DefenceNoteAddDTO c);

    Boolean Update(ModelsDTO.DefenceNoteUpdateDTO c);

    Boolean Delete(Models.DefenceNote c);

    ModelsDTO.DefenceNoteDTO Get(String defenceNoteId);
  }
}
