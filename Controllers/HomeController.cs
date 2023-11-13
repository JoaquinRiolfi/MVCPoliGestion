using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using Dapper;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MVC.Models;

namespace MVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult ListarPolicias(Policia Pol, int Idpolicia)
        {
            ViewBag.Lista = BD.ListarPolicias();
            return View();
        }

        public IActionResult ListarRutas(int idPolicia)
        {
            ViewBag.Listar = BD.ListarRutas(idPolicia);
            ViewBag.IdPolicia = idPolicia; 
            return View();
        }

        public IActionResult ModificarPolicia(int idPolicia)
        {
            
            ViewBag.ListaRoles = BD.ListarRoles();
            Policia PoliModi = BD.ObtenerPolicia(idPolicia);
            ViewBag.Id = PoliModi.Idpolicia;
            ViewBag.DNI = PoliModi.DNI;
            ViewBag.Nombre = PoliModi.Nombre;
            ViewBag.NumeroPlaca = PoliModi.NumeroPlaca;
            ViewBag.Rol = PoliModi.FkRoles;
            ViewBag.FechaNacimiento = PoliModi.FechaNacimiento;
            ViewBag.Password = PoliModi.Password;
            ViewBag.CantidadDias = PoliModi.CantidadRutas;
            
            return View(idPolicia);
        }

        [HttpPost]
        [Route("poli")]
        [ValidateAntiForgeryToken]
        public IActionResult GuardarPolicia2(Policia Pol, int idPolicia)
        {
            System.Console.WriteLine(idPolicia);
            if (ModelState.IsValid)
            {
                BD.ModificarPolicia(Pol, Pol.Idpolicia);
                return RedirectToAction("ListarPolicias");
            }
            return View("ModificarPolicia", Pol);
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult AgregarRuta(int idRuta, int idPolicia, int idDia)
        {
            ViewBag.IdRuta = idRuta;
            ViewBag.IdPolicia = idPolicia;
            ViewBag.ListaDia = BD.ListarDias();
            return View();
        }

        public IActionResult AgregarPolicia(int idPolicia)
        {
            ViewBag.ListaRoles = BD.ListarRoles();
            ViewBag.IdPolicia = idPolicia;
            return View();
        }

        [HttpPost]
        [Route("policiass")]
        [ValidateAntiForgeryToken]
        public IActionResult GuardarPolicia(Policia Pol)
        {
            Console.WriteLine("El rol se bindea: " + Pol.FkRoles);
            BD.AgregarPolicia(Pol);
            return RedirectToAction("ListarPolicias", new { idPolicia = Pol.Idpolicia });
        }

        [HttpPost]
        [Route("rutas")]
        [ValidateAntiForgeryToken]
        public IActionResult GuardarRuta(Ruta Rut, int idPolicia)
        {
            Console.WriteLine("llega aca");
            ViewBag.IDPolicia = idPolicia;

            Rut.FKPolicia = idPolicia;

            BD.AgregarRuta(Rut, Rut.FKPolicia);
            
            // Redirect to the list of routes for the specific police officer
            return RedirectToAction("ListarRutas", new { idPolicia = Rut.FKPolicia });
        }

        [HttpPost("EliminarPolicia/{idPolicia}")]
        public IActionResult EliminarPolicia(int idPolicia)
        {
            Policia pol = BD.ObtenerPolicia(idPolicia);
            if (pol != null)
            {
                BD.EliminarPolicia(idPolicia);
            }
            
            return RedirectToAction("ListarPolicias", new { Idpolicia = idPolicia});
        }

        [HttpPost("EliminarRuta/{idRuta}")]
        
        public IActionResult EliminarRuta(int idRuta)
        {
            Ruta ruta = BD.ObtenerRuta(idRuta);
            
            
            BD.EliminarRuta(idRuta);
            

            // Redirigir a la acción ListarRutas sin pasar el IdRuta
            return RedirectToAction("ListarRutas", new { idPolicia = ruta.FKPolicia });
        }

        public IActionResult Login()
        {
            return View();
        }

        public IActionResult Error()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Login(string username, string password)
        {
            Console.WriteLine("llegue");
            if (username == "admin" && password == "juanito123")
            {
                return RedirectToAction("ListarPolicias", "Home");
            }
            else
            {
                return RedirectToAction("Error", "Home");
            }
        }
    }
}