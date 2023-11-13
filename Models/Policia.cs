using System;
namespace MVC.Models
{
    public class Policia
    {   
        private int _DNI;
        private string? _nombre;
        private string? _numeroPlaca;
        private string? _rol;
        private DateTime _fechaNacimiento;
        private string? _password;
        private int _idpolicia;
        private int _fkRoles;
        private int _cantidadRutas;

        public int CantidadRutas
        {
            get
            {
                return _cantidadRutas;
            }
            set
            {
                _cantidadRutas = value;
            }

        }
        public int FkRoles
        {
            get
            {
                return _fkRoles;
            }
            set
            {
                _fkRoles = value;
            }

        }
        public int DNI
        {
            get
            {
                return _DNI;
            }
            set
            {
                _DNI = value;
            }

        }
        public string? Nombre
        {
            get
            {
                return _nombre;
            }
            set
            {
                _nombre = value;
            }
        }
        public string? NumeroPlaca
        {
            get
            {
                return _numeroPlaca;
            }
            set
            {
                _numeroPlaca = value;
            }
        }
        public string? Rol
        {
            get
            {
                return _rol;
            }
            set
            {
                _rol = value;
            }
        }
        public DateTime FechaNacimiento
        {
            get
            {
                return _fechaNacimiento;
            }
            set
            {
                _fechaNacimiento = value;
            }
        }
        public string? Password
        {
            get
            {
                return _password;
            }
            set
            {
                _password = value;
            }
        }
        public int Idpolicia
        {
            get
            {
                return _idpolicia;
            }
            set
            {
                _idpolicia = value;
            }
        }
    }
}