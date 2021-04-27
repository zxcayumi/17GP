using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.Models
{
    /// <summary>
    /// 化验单打印机配置信息
    /// </summary>
    //[Entity("Device_PaperPrinter", "ID")]
    public class PaperPrinter
    {
        /// <summary>
        /// 发卡器编号
        /// </summary>		
        //[DataField("ID", "nvarchar")]
        //[Validate("发卡器编号不允许为空")]
        public string ID { get; set; }

        /// <summary>
        /// 型号
        /// </summary>		
        //[DataField("Pattern", "nvarchar")]
        public string Pattern { get; set; }

        /// <summary>
        /// 实现类的后缀名
        /// </summary>		
        //[DataField("Remark", "nvarchar")]
        public string Remark { get; set; }

        /// <summary>
        /// 端口
        /// </summary>		
        //[DataField("Port", "nvarchar")]
        public string Port { get; set; }

        /// <summary>
        /// 波特率
        /// </summary>		
        //[DataField("Baud", "int")]
        public int Baud { get; set; }

        /// <summary>
        /// 医院名称
        /// </summary>		
        //[DataField("HospitalName", "nvarchar")]
        public string HospitalName { get; set; }

        /// <summary>
        /// 备注
        /// </summary>		
        //[DataField("Memo", "nvarchar")]
        public string Memo { get; set; }
    }
}
