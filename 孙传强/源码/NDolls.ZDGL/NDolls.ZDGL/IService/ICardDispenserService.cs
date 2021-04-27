using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.IService
{
    public interface ICardDispenserService
    {
        Boolean Add(ModelsDTO.CardDispenserAddDTO cardDispenser);
        Boolean Delete(Models.CardDispenser id);
       Boolean Update(ModelsDTO.CardDispenserUpdateDTO cardDispenser);
    }
}
