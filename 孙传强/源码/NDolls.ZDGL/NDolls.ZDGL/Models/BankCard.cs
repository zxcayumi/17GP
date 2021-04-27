using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.Models
{
    /// <summary>
    /// 银行卡实体类
    /// </summary>
    public class BankCard
    {
        /// <summary>
        /// 卡号
        /// </summary>
        public String BankCardNo { get; set; }

        /// <summary>
        /// 失效日期（YYMM）
        /// </summary>
        public String EndDate { get; set; }

        /// <summary>
        /// 交换控制符
        /// 0无限制、2限制在国内跨系统、3限制在省内跨系统、4限制在市内跨系统、
        /// 5限制在国内系统内、6限制在省内系统内、7限制在市内系统内、8管理卡不适用于交换、9系统测试卡
        /// </summary>
        public String Exchangecode { get; set; }

        /// <summary>
        /// 服务代码：
        /// 01无限制、02无自动柜员机服务、02只有自动柜员机服务、
        /// 10无现金预支、11无现金预支又无自动柜员机服务、
        /// 20要求肯定授权：所有授权应由发卡行或代理人认可、21集成电路卡：无限制、
        /// 23集成电路卡：只有自动柜员机服务
        /// </summary>
        public String ServiceCode { get; set; }
    }
}
