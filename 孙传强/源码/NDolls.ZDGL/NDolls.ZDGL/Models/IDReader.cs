using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.Models
{
    /// <summary>
    /// 身份证配置信息
    /// </summary>

    public class IDReader
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
        /// 备注
        /// </summary>		

        public string Memo { get; set; }
    }
}
