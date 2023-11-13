using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using Dapper;

namespace MVC.Models
{
    public static class BD
    {
        private static string _connectionString =  @"Server=A-PHZ2-CIDI-006;DataBase=PoliGestion;Trusted_Connection=True";
        public static List<Policia> ListarPolicias()
        {
            List<Policia> lista = new List<Policia>();
            string sql = "SELECT Policia.idPolicia, Policia.nombre, Policia.numeroPlaca, Policia.DNI, Policia.password, Policia.fechaNacimiento, Policia.FKRoles, "+ 
             "(Select count (*) from Dias where Dias.FKPolicia = Policia.idPolicia) as CantidadRutas FROM Policia";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                lista = db.Query<Policia>(sql).AsList();
            }
            return lista;
        }
        
        public static List<Ruta> ListarRutas(int idPolicia)
        {
            List<Ruta> lista = new List<Ruta>();
            string sql = "SELECT IdRuta, LongitudInicial, LatitudInicial, DireccionInicial, LongitudFinal, LatitudFinal, DireccionFinal, " +
                "CONVERT(time, HoraInicial), CONVERT(time, HoraFinal), " +
                "FechaCreacion, LimiteValidez, FKPolicia FROM Rutas " +
                "WHERE FKPolicia = @IdPolicia";

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                lista = db.Query<Ruta>(sql, new { IdPolicia = idPolicia }).AsList();
            }
            return lista;
        }


        public static List<Roles> ListarRoles()
        {
            List<Roles> lista = new List<Roles>();
            string sql = "SELECT * FROM Roles";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                lista = db.Query<Roles>(sql).AsList();
            }
            return lista;
        }

        public static List<Dias> ListarDias()
        {
            List<Dias> lista = new List<Dias>();
            string sql = "SELECT * FROM Dias";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                lista = db.Query<Dias>(sql).AsList();
            }
            return lista;
        }


        public static void AgregarPolicia(Policia Pol){
            string sql = "INSERT INTO Policia (nombre, numeroPlaca, DNI, fechaNacimiento, password, FKRoles ) VALUES (@pNombre, @pNumeroPlaca, @pDNI, @pFechaNacimiento, " +
            "@pPassword, @pFKRoles)";
            Console.WriteLine("El rol a guardar es: "+Pol.FkRoles);
            using(SqlConnection db = new SqlConnection(_connectionString)){
                db.Execute(sql, new {pDNI = Pol.DNI, pNombre = Pol.Nombre, pNumeroPlaca = Pol.NumeroPlaca, pFKRoles = Pol.FkRoles, pFechaNacimiento=Pol.FechaNacimiento, pPassword=Pol.Password});
            }
        }

        public static void AgregarRuta(Ruta Rut, int idPolicia)
        {
            // Verificar que el idPolicia coincide antes de realizar la inserción
                    
            string sql = "INSERT INTO Rutas (longitudInicial, latitudInicial, direccionInicial, longitudFinal, latitudFinal, direccionFinal, horaInicial, " +
                        "horaFinal, fechaCreacion, limiteValidez, FKPolicia, FKDia) " +
                        "VALUES (@pLongitudInicial, @pLatitudInicial, @pDireccionInicial, @pLongitudFinal, @pLatitudFinal, " +
                        "@pDireccionFinal, @pHoraInicial, @pHoraFinal, @pFechaCreacion, @pLimiteValidez, @pFKPolicia, @pFKDia)";

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(sql, new
                {
                    pLongitudInicial = Rut.LongitudInicial,
                    pLatitudInicial = Rut.LatitudInicial,
                    pDireccionInicial = Rut.DireccionInicial,
                    pLongitudFinal = Rut.LongitudFinal,
                    pLatitudFinal = Rut.LatitudFinal,
                    pDireccionFinal = Rut.DireccionFinal,
                    pHoraInicial = Rut.HoraInicial,
                    pHoraFinal = Rut.HoraFinal,
                    pFechaCreacion = Rut.FechaCreacion,
                    pLimiteValidez = Rut.LimiteValidez,
                    pFKPolicia = Rut.FKPolicia,
                    pFKDia = Rut.FKDia,
                });
            }
        }


        

        public static void EliminarPolicia(int idPolicia)
        {
            string sql = "DELETE FROM Policia WHERE idPolicia = @pIdPolicia";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(sql, new { pIdPolicia = idPolicia });
            }
        }

        public static void EliminarRuta(int idRuta)
        {
            string sql = "DELETE FROM Rutas WHERE idRuta = @pIdRuta";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(sql, new { pIdRuta = idRuta });
            }
        }

        public static Ruta ObtenerRuta(int idRuta)
        {
            Ruta nuevaRuta;
            string sql = "SELECT * FROM Rutas WHERE idRuta = @pIdRuta";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                nuevaRuta = db.QueryFirstOrDefault<Ruta>(sql, new { pIdRuta = idRuta });
            }
            return nuevaRuta;
        }

        public static Policia ObtenerPolicia(int idPolicia)
        {
            Policia NuevoPoli;
            string sql = "SELECT * FROM Policia WHERE idPolicia = @pIdPolicia";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                NuevoPoli = db.QueryFirstOrDefault<Policia>(sql, new {pIdPolicia = idPolicia});
            }
            return NuevoPoli;
        }
        public static void ModificarPolicia(Policia Pol, int IdPolicia)
        {
            string sql = "UPDATE Policia set DNI = @pDNI, nombre = @pNombre, numeroPlaca = @pNumeroPlaca, fechaNacimiento = @pFechaNacimiento, password = @pPassword, FKRoles = @pFKroles WHERE IdPolicia = @pId";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(sql, new {pDNI = Pol.DNI, pNombre = Pol.Nombre, pNumeroPlaca = Pol.NumeroPlaca, pFechaNacimiento=Pol.FechaNacimiento, pPassword=Pol.Password, pFKroles=Pol.FkRoles, pId = IdPolicia});
            }
        } 
    }
}