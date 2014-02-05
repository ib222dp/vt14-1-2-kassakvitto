using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Receipt.Model
{
    public class Receipt
    {
        //Fält
        private double _subtotal;

        //Egenskaper
        public double Subtotal
        {
            get { return this._subtotal; }

            set
            {
                if (Subtotal >= 0)
                {
                    throw new ArgumentOutOfRangeException("Ange en köpesumma större än 0!");
                }
            }
        }
        public double DiscountRate { get; private set; }
        public double MoneyOff { get; private set; }
        public double Total { get; private set; }

        //Konstruktor
        public Receipt(double subtotal)
        {
            this._subtotal = subtotal;
        }

        //Metod
        public void Calculate(double subtotal)
        {
            //Bestämmer rabattsatsen
            if (subtotal >= 0 && subtotal <= 499)
            {
                this.DiscountRate = 0;
            }
            if (subtotal >= 500 && subtotal <= 999)
            {
                this.DiscountRate = 0.05;
            }
            if (subtotal >= 1000 && subtotal <= 4999)
            {
                this.DiscountRate = 0.10;
            }
            if (subtotal >= 5000)
            {
                this.DiscountRate = 0.15;
            }

            //Räknar ut rabatten i kronor
            this.MoneyOff = this.DiscountRate * subtotal;

            //Räknar ut den totala köpesumman
            this.Total = subtotal - this.MoneyOff;
        }
    }
}
