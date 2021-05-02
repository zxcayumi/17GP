using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CardDispenserController : Controller
    {
        private IService.ICardDispenserService D;

        public CardDispenserController(IService.ICardDispenserService D)
        {
            this.D = D;
        }


        [HttpPost]
        public IActionResult Create(ModelsDTO.CardDispenserAddDTO cardDispenser)
        {
            try
            {
               D.Add(cardDispenser);
                return Ok(cardDispenser);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.ToString());
            }
        }
        [HttpDelete]
        public IActionResult Delete(String Id)
        {
            Models.CardDispenser model = new Models.CardDispenser();
            model.ID = Id ;

            return Ok(D.Delete(model));
        }

        [HttpPut]
        public IActionResult Update(ModelsDTO.CardDispenserUpdateDTO cardDispenser)
        {

            if (D.Update(cardDispenser))
                return Ok(cardDispenser);
            else
                return BadRequest();
        }
    }
}
