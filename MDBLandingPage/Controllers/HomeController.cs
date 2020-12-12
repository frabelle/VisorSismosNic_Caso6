using MDBLandingPage.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MDBLandingPage.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.FullPageIntro = true;
            ViewBag.RenderCarousel = false;
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            ViewBag.FullPageIntro = false;
            ViewBag.RenderCarousel = false;
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            ViewBag.FullPageIntro = false;
            ViewBag.RenderCarousel = false;
            return View();
        }

        public ActionResult Buttons(string Coordinates, string type)
        {
            List<SismosViews> sismos = new List<SismosViews>();

            if (Coordinates != null)
            {
                //Construct the data
                var NewShape = StringHelper.ChangeStringByShape(type, Coordinates);

                if (type == "rectangle")
                {
                    //Use MakeEnvelope
                    var WKT = SpatialHelper.CreateRectangleWKT(NewShape);
                    //Use Intersects
                    sismos = SpatialHelper.GetInformationByPolygon(WKT);
                }
                else if (type == "polygon")
                {
                    //Transform
                }
                else if (type == "marker")
                {
                    //Get nearest point

                }
            }
            else
            {
                sismos = SpatialHelper.GetAll();
            }

            ViewBag.FullPageIntro = false;
            ViewBag.RenderCarousel = true;
            return View(sismos);
        }

        public ActionResult Visor()
        {
            ViewBag.Message = "Visor de Magnitus Sísmica en los departamentos de Nicaragua";
            ViewBag.FullPageIntro = false;
            ViewBag.RenderCarousel = true;
            return View();
        }

    }
}