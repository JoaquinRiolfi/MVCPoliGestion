using System;
namespace MVC.Models
{
    public class Roles
    {   
        private string? _roles;
        private int _idRol;
        public string? Rol
        {
            get
            {
                return _roles;
            }
            set
            {
                _roles = value;
            }
        }
        public int IdRol
        {
            get
            {
                return _idRol;
            }
            set
            {
                _idRol = value;
            }
        }
    }
}