using QLBOWLING.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using static QLBOWLING.DTO.Lane;

namespace QLBOWLING.BUS
{
    public class BUS_Lane
    {
            public DataTable LoadLane()
            {
                DAO_Lane daoLane = new DAO_Lane();
                return daoLane.LoadLane();
            }
        

    }
}