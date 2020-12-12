using Npgsql;
using System;
using System.Collections.Generic;
using System.Configuration;

namespace MDBLandingPage.Models
{
    public class SpatialHelper
    {
        public static string CreateRectangleWKT(string Shape)
        {
            try
            {
                string WKT = "";
                var Datos = Shape.Split(',');

                double d1 = Convert.ToDouble(Datos[0]);
                double d2 = Convert.ToDouble(Datos[1]);
                double d3 = Convert.ToDouble(Datos[2]);
                double d4 = Convert.ToDouble(Datos[3]);
                int SRID = 4326;

                string connectionString = ConfigurationManager.ConnectionStrings["Caso6"].ToString();
                NpgsqlConnection conn = new NpgsqlConnection(connectionString);
                conn.Open();

                string Transact = "SELECT ST_AsText(ST_MakeEnvelope(@d1, @d2, @d3, @d4, @sr))";

                using (NpgsqlCommand cmd = new NpgsqlCommand(Transact, conn))
                {
                    cmd.Parameters.AddWithValue("@d1", d1);
                    cmd.Parameters.AddWithValue("@d2", d2);
                    cmd.Parameters.AddWithValue("@d3", d3);
                    cmd.Parameters.AddWithValue("@d4", d4);
                    cmd.Parameters.AddWithValue("@sr", SRID);
                    NpgsqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        WKT = dr[0].ToString();
                    }
                }

                conn.Close();
                return WKT;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static List<SismosViews> GetInformationByPolygon(string NewPolygon)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Caso6"].ToString();
                NpgsqlConnection conn = new NpgsqlConnection(connectionString);
                conn.Open();

                List<SismosViews> Information = new List<SismosViews>();

                string Transact = "SELECT * FROM spatial.registrosismos WHERE ST_Intersects('SRID=4326;" + NewPolygon + "', geom)";

                using (NpgsqlCommand cmd = new NpgsqlCommand(Transact, conn))
                {
                    NpgsqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        SismosViews c = new SismosViews();
                        c.departamento = dr[0].ToString();
                        c.magnitud = Convert.ToDouble(dr[1].ToString());
                        c.profundidad = dr[2].ToString();
                        c.periodo = Convert.ToInt32(dr[3].ToString());
                        c.Lat = dr.IsDBNull(2) ? 0f : Convert.ToSingle(dr[4].ToString());
                        c.Lng = dr.IsDBNull(3) ? 0f : Convert.ToSingle(dr[5].ToString());
                        Information.Add(c);
                    }
                }

                conn.Close();
                return Information;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static List<SismosViews> GetAll()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Caso6"].ToString();
                NpgsqlConnection conn = new NpgsqlConnection(connectionString);
                conn.Open();

                List<SismosViews> Information = new List<SismosViews>();

                string Transact = "SELECT departamento, magnitud, profundidad, periodo FROM spatial.registrosismos";

                using (NpgsqlCommand cmd = new NpgsqlCommand(Transact, conn))
                {
                    NpgsqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        SismosViews c = new SismosViews();
                        c.departamento = dr[0].ToString();
                        c.magnitud = Convert.ToDouble(dr[1].ToString());
                        c.profundidad = dr[2].ToString();
                        c.periodo = Convert.ToInt32(dr[3].ToString());
                        Information.Add(c);
                    }
                }

                conn.Close();
                return Information;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}