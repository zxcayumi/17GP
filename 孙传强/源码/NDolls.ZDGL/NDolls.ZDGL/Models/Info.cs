using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.Models
{
    /// <summary>
    /// 设备信息
    /// </summary>

    public class Info
    {
        /// <summary>
        /// 终端ID
        /// </summary>		

        public string DeviceID { get; set; }

        /// <summary>
        /// 终端编号
        /// </summary>		

        public int? DeviceNo { get; set; }

        /// <summary>
        /// 设备型号（关联字典）
        /// </summary>		

        public string Pattern { get; set; }

        ///// <summary>
        ///// 终端IP
        ///// </summary>		
        //[DataField("IP", "nvarchar")]
        //public string IP { get; set; }

        ///// <summary>
        ///// 摆放位置
        ///// </summary>		
        //[DataField("Address", "nvarchar")]
        //public string Address { get; set; }

        ///// <summary>
        ///// 关机时间
        ///// </summary>		
        //[DataField("ShutTime", "nvarchar")]
        //public string ShutTime { get; set; }

        ///// <summary>
        ///// 版本信息
        ///// </summary>		
        //[DataField("VersionInfo", "nvarchar")]
        //public string VersionInfo { get; set; }

        ///// <summary>
        ///// 结算密码
        ///// </summary>		
        //[DataField("CheckPwd", "nvarchar")]
        //public string CheckPwd { get; set; }

        ///// <summary>
        ///// 最近结算日期
        ///// </summary>		
        //[DataField("CheckTime", "datetime")]
        //public DateTime CheckTime { get; set; }

        ///// <summary>
        ///// 状态
        ///// </summary>		
        //[DataField("Status", "nvarchar")]
        //public string Status { get; set; }

        /// <summary>
        /// 描述
        /// </summary>		
       
        public string Memo { get; set; }

        ///// <summary>
        ///// 首页功能菜单（关联字典）
        ///// </summary>		
        //[DataField("Menu", "nvarchar")]
        //public string Menu { get; set; }

        ///// <summary>
        ///// 支付方式（关联字典）
        ///// </summary>		
        //[DataField("PayType", "nvarchar")]
        //public string PayType { get; set; }

        /// <summary>
        /// 发卡器型号
        /// </summary>		

        public string CardDispenser { get; set; }

        /// <summary>
        /// 发卡器型号编号
        /// </summary>		

        public string CardDispenserID { get; set; }

        /// <summary>
        /// 读卡器型号
        /// </summary>		
    
        public string CardReader { get; set; }

        /// <summary>
        /// 读卡器型号编号
        /// </summary>		
    
        public string CardReaderID { get; set; }

        /// <summary>
        /// 身份证型号
        /// </summary>		

        public string IDReader { get; set; }

        /// <summary>
        /// 身份证型号编号
        /// </summary>		

        public string IDReaderID { get; set; }

        /// <summary>
        /// 热敏打印型号
        /// </summary>		

        public string ThermalPrinter { get; set; }

        /// <summary>
        /// 热敏打印型号编号
        /// </summary>		
        public string ThermalPrinterID { get; set; }

        /// <summary>
        /// 化验单打印型号
        /// </summary>		
        public string PaperPrinter { get; set; }

        /// <summary>
        /// 化验单打印型号编号
        /// </summary>		
        public string PaperPrinterID { get; set; }

        /// <summary>
        /// 医院名称
        /// </summary>		
        //[DataField("HospitalName", "nvarchar")]
        //public string HospitalName { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>		

        public DateTime CreateTime { get; set; }
    }
}
