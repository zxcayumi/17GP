using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.IService
{
    public  interface IIDCardService
    {
        Boolean Add(ModelsDTO.IDCardAddDTO IdCard);
        Boolean Delete(Models.IDCard iDCard);
        Boolean Update(ModelsDTO.IDCradUpdateDTO iDCrad);

        /// <summary>
        /// 按主键获取身份证信息
        /// </summary>
        /// <param name="idNo">身份证号</param>
        /// <returns>身份信息</returns>
        ModelsDTO.IDCardDTO Get(String idNo);
    }
}
