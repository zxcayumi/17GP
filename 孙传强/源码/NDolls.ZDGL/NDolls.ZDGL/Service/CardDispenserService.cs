using AutoMapper;
using NDolls.ZDGL.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.Service
{
    public class CardDispenserService : ICardDispenserService
    {
        private DBContext db;
        private IMapper mapper;
        public CardDispenserService(DBContext db, IMapper mapper)
        {
            this.mapper = mapper;
            this.db = db;
        }

        public Boolean Add(ModelsDTO.CardDispenserAddDTO cardDispenser)
        {
            Models.CardDispenser model = new Models.CardDispenser();
            mapper.Map(cardDispenser, model);
            db.CardDispensers.Add(model);
            return db.SaveChanges() > 0 ? true : false;
        }

        public Boolean Delete(Models.CardDispenser cardDispenser)
        {
            db.Remove(cardDispenser);
            return db.SaveChanges() > 0 ? true : false;
        }

        public Boolean Update(ModelsDTO.CardDispenserUpdateDTO cardDispenser )
        {
            Models.CardDispenser model = db.CardDispensers.FirstOrDefault(D=> D.ID == cardDispenser.ID);
            mapper.Map(cardDispenser, model);

            db.CardDispensers.Update(model);
            return db.SaveChanges() > 0 ? true : false;
        }


    }
}

