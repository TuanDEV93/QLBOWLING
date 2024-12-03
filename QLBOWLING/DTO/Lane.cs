using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBOWLING.DTO
{
    public class Lane
    {


        public class LaneDTO
        {
            public int LaneID { get; set; }
            public string LaneName { get; set; }
            public bool StatusLane { get; set; }
            public string CssClass
            {
                get
                {
                    return StatusLane ? "btn btn-success" : "btn btn-danger";
                }
            }
        }

    }

}
