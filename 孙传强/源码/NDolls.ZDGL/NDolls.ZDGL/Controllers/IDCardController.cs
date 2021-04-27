using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class IDCardController : Controller
    {
        private IService.IIDCardService I;

        public IDCardController(IService.IIDCardService I)
        {
            this.I = I;
        }

        [HttpPost]
        public IActionResult Create(ModelsDTO.IDCardAddDTO IdCard)
        {
            try
            {
                I.Add(IdCard);
                return Ok(IdCard);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.ToString());
            }
        }
        [HttpDelete]
        [Route("{IdNo}")]
        public IActionResult Delete(String IdNo)
        {
            Models.IDCard model = new Models.IDCard();
            model.IDNo = IdNo;

            return Ok(I.Delete(model));
        }

        [HttpPut]
        public IActionResult Update(ModelsDTO.IDCradUpdateDTO iDCrad)
        {
            if (I.Update(iDCrad))
                return Ok(iDCrad);
            else
                return BadRequest();
        }

     
        [HttpGet]
        [Route("{IdNo}")]
        public IActionResult Get(String idNo)
        {
            ModelsDTO.IDCardDTO model = I.Get(idNo);

            if (model != null)
                return Ok(model);
            else
                return NotFound();

        }
    }
}
