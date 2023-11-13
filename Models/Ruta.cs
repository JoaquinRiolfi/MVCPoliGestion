using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MVC.Models
{
    public class Ruta
    {
        private int _idRuta;
        private float _longitudInicial;
        private float _latitudInicial;
        private string? _direccionInicial;
        private float _longitudFinal;
        private float _latitudFinal;
        private string? _direccionFinal;
        private TimeSpan _horaInicial;
        private TimeSpan _horaFinal;
        private DateTime _fechaCreacion;
        private DateTime _limiteValidez;
        private int _fkPolicia;
        private int _fkDia;

        public int IdRuta
        {
            get
            {
                return _idRuta;
            }
            set
            {
                _idRuta = value;
            }
        }


        public float LongitudInicial
        {
            get
            {
                return _longitudInicial;
            }
            set
            {
                _longitudInicial = value;
            }
        }


        public float LatitudInicial
        {
            get
            {
                return _latitudInicial;
            }
            set
            {
                _latitudInicial = value;
            }
        }


        public string? DireccionInicial
        {
            get
            {
                return _direccionInicial;
            }
            set
            {
                _direccionInicial = value;
            }
        }


        public float LongitudFinal
        {
            get
            {
                return _longitudFinal;
            }
            set
            {
                _longitudFinal = value;
            }
        }


        public float LatitudFinal
        {
            get
            {
                return _latitudFinal;
            }
            set
            {
                _latitudFinal = value;
            }
        }


        public string? DireccionFinal
        {
            get
            {
                return _direccionFinal;
            }
            set
            {
                _direccionFinal = value;
            }
        }


        public TimeSpan HoraInicial
        {
            get
            {
                return _horaInicial;
            }
            set
            {
                _horaInicial = value;
            }
        }


        public TimeSpan HoraFinal
        {
            get
            {
                return _horaFinal;
            }
            set
            {
                _horaFinal = value;
            }
        }


        public DateTime FechaCreacion
        {
            get
            {
                return _fechaCreacion;
            }
            set
            {
                _fechaCreacion = value;
            }
        }


        public DateTime LimiteValidez
        {
            get
            {
                return _limiteValidez;
            }
            set
            {
                _limiteValidez = value;
            }
        }


        public int  FKPolicia
        {
            get
            {
                return _fkPolicia;
            }
            set
            {
                _fkPolicia = value;
            }
        }
        public int  FKDia
        {
            get
            {
                return _fkDia;
            }
            set
            {
                _fkDia = value;
            }
        }
    }
}