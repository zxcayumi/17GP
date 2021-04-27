using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.ModelsDTO
{
    [Table("Device_CardReader")]
    public class CradReadUpdateDTO
    {
        /// <summary>
        /// 发卡器编号
        /// </summary>		

        public string ID { get; set; }

        /// <summary>
        /// 型号
        /// </summary>		

        public string Pattern { get; set; }

        /// <summary>
        /// 实现类的后缀名
        /// </summary>		

        public string Remark { get; set; }

        /// <summary>
        /// 端口
        /// </summary>		

        public string Port { get; set; }

        /// <summary>
        /// 波特率
        /// </summary>		

        public int Baud { get; set; }

        /// <summary>
        /// 卡型:射频卡、磁条卡
        /// </summary>		

        public string CardType { get; set; }

        /// <summary>
        /// 射频卡类型TypeA,TypeB
        /// </summary>		

        public string RFCardType { get; set; }

        /// <summary>
        /// 射频卡密码
        /// </summary>		

        public string RFCardPwd { get; set; }

        /// <summary>
        /// 射频卡密码类型(KeyA,KeyB)
        /// </summary>		

        public string RFCardPwdType { get; set; }

        /// <summary>
        /// 射频卡扇区索引
        /// </summary>		

        public int RFCardSectionIndex { get; set; }

        /// <summary>
        /// 射频卡块索引
        /// </summary>		

        public int RFCardBlockIndex { get; set; }

        /// <summary>
        /// 磁条卡磁道索引
        /// </summary>		

        public int MagneticCardIndex { get; set; }

        /// <summary>
        /// 卡号起始位置
        /// </summary>		

        public int CardNoStart { get; set; }

        /// <summary>
        /// 卡号长度
        /// </summary>		

        public int CardNoLen { get; set; }

        /// <summary>
        /// 备注
        /// </summary>		

        public string Memo { get; set; }
    }
}
