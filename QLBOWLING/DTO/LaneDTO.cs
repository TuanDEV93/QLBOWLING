using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBOWLING.DTO
{
    public class LaneDTO
    {

        public int LaneID { get; set; }
        public string LaneName { get; set; }
        public bool Status { get; set; }
        public int PriceLane { get; set; }
        public string CssClass
        {
            get
            {
                return Status? "btn btn-success" : "btn btn-danger";
            }
        }

    }

}
