using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CradReadController: Controller
    {
        private IService.ICradReaderService I;

        public CradReadController(IService.ICradReaderService I)
        {
            this.I = I;
        }

        [HttpPost]
        public IActionResult Create(ModelsDTO.CradReaderAddDTO cardReader)
        {
            try
            {
                I.Add(cardReader);
                return Ok(cardReader);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.ToString());
            }
        }
        [HttpDelete]
        public IActionResult Delete(String Id)
        {
            Models.CardReader model = new Models.CardReader();
            model.ID = Id;

            return Ok(I.Delete(model));
        }

        [HttpPut]
        public IActionResult Update(ModelsDTO.CradReadUpdateDTO cradReader)
        {
            if (I.Update(cradReader))
                return Ok(cradReader);
            else
                return BadRequest();
        }

        [HttpGet]
        public IActionResult Get(String id)
        {
            ModelsDTO.CradReaderDTO model = I.Get(id);

            if (model != null)
                return Ok(model);
            else
                return NotFound();

        }
    }
}
