using System;

namespace MVC.Models
{
    public class Dias
    {   
        private int _idDia;
        private string? _dia;
        private int _fkPolicia;

        public int IdDia
        {
            get
            {
                return _idDia;
            }
            set
            {
                _idDia = value;
            }
        }

        public string? Dia
        {
            get
            {
                return _dia;
            }
            set
            {
                _dia = value;
            }
        }

        public int FkPolicia
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
    }
}
