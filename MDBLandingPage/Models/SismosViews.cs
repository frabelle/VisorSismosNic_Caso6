using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MDBLandingPage.Models
{
    public class SismosViews
    {
        public string departamento { get; set; }
        public double magnitud { get; set; }
        public string profundidad { get; set; }
        public int periodo { get; set; }
        public float Lat { get; set; }
        public float Lng { get; set; }
    }
}