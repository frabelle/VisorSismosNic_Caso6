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

        public static List<sismos> GetInformationByPolygon(string NewPolygon)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Caso6"].ToString();
                NpgsqlConnection conn = new NpgsqlConnection(connectionString);
                conn.Open();

                List<sismos> Information = new List<sismos>();

                string Transact = "SELECT * FROM spatial.sismos WHERE ST_Intersects('SRID=4326;" + NewPolygon + "', geom)";

                using (NpgsqlCommand cmd = new NpgsqlCommand(Transact, conn))
                {
                    NpgsqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        sismos c = new sismos();
                        c.id = Convert.ToInt32(dr[0].ToString());
                        c.id_departamento = Convert.ToInt32(dr[1].ToString());
                        c.id_periodo = Convert.ToInt32(dr[2].ToString());
                        c.profundidad = Convert.ToDouble(dr[3].ToString());
                        c.magnitud = Convert.ToDouble(dr[4].ToString());
                        c.Lat = dr.IsDBNull(2) ? 0f : Convert.ToSingle(dr[5].ToString());
                        c.Lng = dr.IsDBNull(3) ? 0f : Convert.ToSingle(dr[6].ToString());
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

        public static List<sismos> GetAll()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Caso6"].ToString();
                NpgsqlConnection conn = new NpgsqlConnection(connectionString);
                conn.Open();

                List<sismos> Information = new List<sismos>();

                string Transact = "SELECT * FROM spatial.sismos";

                using (NpgsqlCommand cmd = new NpgsqlCommand(Transact, conn))
                {
                    NpgsqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        sismos c = new sismos();
                        c.id = Convert.ToInt32(dr[0].ToString());
                        c.id_departamento = Convert.ToInt32(dr[1].ToString());
                        c.id_periodo = Convert.ToInt32(dr[2].ToString());
                        c.profundidad = Convert.ToDouble(dr[3].ToString());
                        c.magnitud = Convert.ToDouble(dr[4].ToString());
                        c.Lat = dr.IsDBNull(2) ? 0f : Convert.ToSingle(dr[5].ToString());
                        c.Lng = dr.IsDBNull(3) ? 0f : Convert.ToSingle(dr[6].ToString());
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