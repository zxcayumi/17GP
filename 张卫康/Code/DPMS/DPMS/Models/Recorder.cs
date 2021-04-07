using System;
using System.Collections.Generic;

#nullable disable

namespace DPMS.Models
{
    public partial class Recorder
    {
        public int SystemId { get; set; }
        public string RecorderId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string RealName { get; set; }
        public string Gender { get; set; }
        public string Mobile { get; set; }
        public string HeadPic { get; set; }
        public string Qqid { get; set; }
        public string WeChatId { get; set; }
        public string Memo { get; set; }
        public string Status { get; set; }
        public DateTime? CreateTime { get; set; }
        public DateTime? UpdateTime { get; set; }
        public string Modifier { get; set; }
    }
}
