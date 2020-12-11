using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MDBLandingPage.Models
{
    public class sismos
    {
        public int id { get; set; }
        public double magnitud { get; set; }

        [ForeignKey("id_departamento")]
        public int id_departamento { get; set; }

        [ForeignKey("id_periodo")]
        public int id_periodo { get; set; }
        public float Lat { get; set; }
        public float Lng { get; set; }


    }
}