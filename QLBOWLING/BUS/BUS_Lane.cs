using QLBOWLING.DAO;
using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using static QLBOWLING.DTO.LaneDTO;

namespace QLBOWLING.BUS
{
    public class BUS_Lane
    {
        DAO_Lane daoLane = new DAO_Lane();
        public DataTable LoadLane()
        {
               
            return daoLane.LoadLane();
        }
        public int GetLanePrice(int laneID)
        {
            return daoLane.GetLanePrice(laneID);
        }
        public List<LaneDTO> GetLanes()
        {
            return daoLane.GetLanes();
        }

    }
}