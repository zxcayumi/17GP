using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace NDolls.ZDGL.ModelsDTO
{
    [Table("Info_IDCard")]
    public class IDCradUpdateDTO
    {
      

        public string Name { get; set; }

            /// <summary>
            /// 性别
            /// </summary>
            public string Sex { get; set; }

            /// <summary>
            /// 民族
            /// </summary>
            public string Nation { get; set; }

            /// <summary>
            /// 出生日期
            /// </summary>
            public string Birthday { get; set; }

            /// <summary>
            /// 住址
            /// </summary>
            public string Address { get; set; }

            /// <summary>
            /// 身份证号
            /// </summary>
            [Key]
            public string IDNo { get; set; }

            /// <summary>
            /// 手机号
            /// </summary>
            public string Mobile { get; set; }

            /// <summary>
            /// 发证机关
            /// </summary>
            public string Department { get; set; }

            /// <summary>
            /// 有效期
            /// </summary>
            public string ExpireDay { get; set; }

            /// <summary>
            /// 头像图片路径
            /// </summary>
            public string PhotoUrl { get; set; }

        }
 
}
