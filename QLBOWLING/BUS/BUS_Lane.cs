using QLBOWLING.DAO;
using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


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
        public bool UpdateLaneStatus(int laneID, bool newStatus)
        {
            return daoLane.UpdateLaneStatus(laneID, newStatus);
        }
    }
}