using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.ModelsDTO
{
    public class DTOProfile : Profile
    {
        public DTOProfile()
        {
           //身份证信息
            CreateMap<IDCardAddDTO, Models.IDCard>();
            CreateMap<IDCradUpdateDTO, Models.IDCard>();
            CreateMap<Models.IDCard, IDCardDTO>();

            //发卡器信息
            CreateMap<CradReaderAddDTO, Models.CardDispenser>();
            CreateMap<CardDispenserUpdateDTO, Models.CardDispenser>();
            CreateMap<Models.CardDispenser, CardDispenserDTO>();

            //读卡器信息
            CreateMap<CradReaderAddDTO, Models.CardReader>();
            CreateMap<CradReadUpdateDTO, Models.CardReader>();
            CreateMap<Models.CardReader, CradReaderDTO>();
        }
    }
}
