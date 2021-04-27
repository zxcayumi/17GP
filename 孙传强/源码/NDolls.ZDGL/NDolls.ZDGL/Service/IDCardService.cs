using AutoMapper;
using NDolls.ZDGL.IService;
using NDolls.ZDGL.ModelsDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.Service
{
    public class IDCardService : IIDCardService
    {
        private DBContext db;
        private IMapper mapper;

        public IDCardService(DBContext db, IMapper mapper)
        {
            this.mapper = mapper;
            this.db = db;
        }
        //Add
        public Boolean Add(ModelsDTO.IDCardAddDTO IdCard)
        {
            Models.IDCard model = new Models.IDCard();
            mapper.Map(IdCard, model);
            db.IDCards.Add(model);
            return db.SaveChanges() > 0 ? true : false;
        }
        //Delete
        public Boolean Delete(Models.IDCard iDCard)
        {
            db.Remove(iDCard);
            return db.SaveChanges() > 0 ? true : false;
        }

        //Update
        public Boolean Update(ModelsDTO.IDCradUpdateDTO iDCrad)
        {
            Models.IDCard model = db.IDCards.FirstOrDefault(I => I.IDNo == iDCrad.IDNo);
            mapper.Map(iDCrad, model);
         
            db.IDCards.Update(model);
            return db.SaveChanges() > 0 ? true : false;
        }

        //Get
        public ModelsDTO.IDCardDTO Get(string idNo)
        {
            Models.IDCard iDCard = db.IDCards.SingleOrDefault(I => (I.IDNo == idNo));
            IDCardDTO model = new IDCardDTO();

            mapper.Map(iDCard, model);
            return model;
        }
    }
}
