using System;
using System.Collections.Generic;

#nullable disable

namespace DPMS.Models
{
    public partial class Student
    {
        public Student()
        {
            DefenceNotes = new HashSet<DefenceNote>();
            DefenceResults = new HashSet<DefenceResult>();
        }

        public int SystemId { get; set; }
        public string StuId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string RealName { get; set; }
        public string Gender { get; set; }
        public string Mobile { get; set; }
        public bool? IsValidMobile { get; set; }
        public string HeadPic { get; set; }
        public DateTime? Birthday { get; set; }
        public string College { get; set; }
        public string Grade { get; set; }
        public string Major { get; set; }
        public string Class { get; set; }
        public string Group { get; set; }
        public string GuideTeacher { get; set; }
        public string StudentStatus { get; set; }
        public string Memo { get; set; }
        public string Status { get; set; }
        public DateTime? CreateTime { get; set; }
        public DateTime? UpdateTime { get; set; }
        public string Modifier { get; set; }

        public virtual ICollection<DefenceNote> DefenceNotes { get; set; }
        public virtual ICollection<DefenceResult> DefenceResults { get; set; }
    }
}
