using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.IService
{
    public interface ICradReaderService
    {
        Boolean Add(ModelsDTO.CradReaderAddDTO cardReader);
        Boolean Delete(Models.CardReader cardReader);
        Boolean Update(ModelsDTO.CradReadUpdateDTO cardReader);

        ModelsDTO.CradReaderDTO Get(String id);
    }
}
