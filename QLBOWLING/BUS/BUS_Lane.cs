using QLBOWLING.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using QLBOWLING.DTO;

namespace QLBOWLING.BUS
{
    public class BUS_Lane
    {
        private DAO_Lane laneDAO;
        public BUS_Lane()
        {
            laneDAO = new DAO_Lane();
        }
        public DataTable LoadLane()
            {
                DAO_Lane daoLane = new DAO_Lane();
                return daoLane.LoadLane();
            }

        public List<LaneDTO> LoadLaneList()
        {
            return laneDAO.LoadLaneList();
        }
    }
}