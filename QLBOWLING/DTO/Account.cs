﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBOWLING.DTO
{
    public class Account
    {
        private int UserID;
        public int USERID
        {
            get { return UserID; }
            set { UserID = value; }
        }
        private string UserName;
        public string Username
        {
            get { return UserName; }
            set { UserName = value; }

        }

        private string DisplayName;
        public string displayName

        {
            get { return DisplayName; }
            set { DisplayName = value; }
        }

        private string PassWord;
        public string passWord

        {
            get { return PassWord; }
            set { PassWord = value; }
        }

        private bool Role;
        public bool role
        {
            get { return Role; }
            set { Role = value; }
        }

        private string Address;
        public string ADDRESS
        {
            get { return Address; }
            set { Address = value; }
        }

        private string Phone;
        public string PHONE
        {
            get { return Phone; }
            set { Phone = value; }
        }
    }
}
