using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.Models
{
    /// <summary>
    /// 社保卡实体类
    /// </summary>
    public class SocialCard
    {
        /// <summary>
        /// 卡的识别码(保留字段)
        /// </summary>
        public String CardID { get; set; }

        /// <summary>
        /// 卡类别
        /// </summary>
        public String CardType { get; set; }

        /// <summary>
        /// 规范版本
        /// </summary>
        public String CardVersion { get; set; }

        /// <summary>
        /// 初始化机构编号(保留字段)
        /// </summary>
        public String OrgNum { get; set; }

        /// <summary>
        /// 发卡日期
        /// </summary>
        public String IssueDate { get; set; }

        /// <summary>
        /// 卡有效期
        /// </summary>
        public String CardPeriod { get; set; }

        /// <summary>
        /// 卡号
        /// </summary>
        public String CardNum { get; set; }

        /// <summary>
        /// 社会保障号码
        /// </summary>
        public String SocialID { get; set; }

        /// <summary>
        /// 姓名
        /// </summary>
        public String Name { get; set; }

        /// <summary>
        /// 姓名扩展(保留字段)
        /// </summary>
        public String NameEx { get; set; }

        /// <summary>
        /// 性别
        /// </summary>
        public String Sex { get; set; }

        /// <summary>
        /// 民族
        /// </summary>
        public String Nation { get; set; }

        /// <summary>
        /// 出生地(保留字段)
        /// </summary>
        public String Address { get; set; }

        /// <summary>
        /// 出生日期
        /// </summary>
        public String Birthday { get; set; }
    }
}
