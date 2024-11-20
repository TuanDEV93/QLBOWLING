using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBOWLING.DTO
{
    public class Account
    {
        private string UserName;
        public string Username
        { get { return UserName; }
          set { UserName = value; } 
        }

        private string DisplayName;
        public string displayName
        { get { return DisplayName; }
          set { DisplayName = value; }
        }

        private string PassWord;
        public string passWord
        { get { return PassWord; }
          set { PassWord = value; } 
        }

        private bool Type;
        public bool type
        { get { return Type; }
          set { Type = value; }
        }
    }
}