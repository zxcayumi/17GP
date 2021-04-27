using AutoMapper;
using NDolls.ZDGL.IService;
using NDolls.ZDGL.ModelsDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.Service
{
    public class CardReaderService : ICradReaderService
    {
        private DBContext db;
        private IMapper mapper;
        public CardReaderService(DBContext db, IMapper mapper)
        {
            this.mapper = mapper;
            this.db = db;
        }
        public Boolean Add(ModelsDTO.CradReaderAddDTO crad)
        {
            Models.CardReader model = new Models.CardReader();
            mapper.Map(crad, model);
            db.cardReaders.Add(model);
            return db.SaveChanges() > 0 ? true : false;
        }

        public Boolean Delete(Models.CardReader card)
        {
            db.Remove(card);
            return db.SaveChanges() > 0 ? true : false;
        }

        public Boolean Update(ModelsDTO.CradReadUpdateDTO card)
        {
            Models.CardReader model = db.cardReaders.FirstOrDefault(C => C.ID == card.ID);
            mapper.Map(card, model);

            db.cardReaders.Update(model);
            return db.SaveChanges() > 0 ? true : false;
        }


        //Get
        public ModelsDTO.CradReaderDTO  Get(string id)
        {
            Models.CardReader cardReader  = db.cardReaders.SingleOrDefault(I => (I.ID == id));
            CradReaderDTO model = new CradReaderDTO();

            mapper.Map(cardReader, model);
            return model;
        }
    }
}
