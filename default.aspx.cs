using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Receipt
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Compute_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                //Instansierar Receipt-objekt och anropar metoden Calculate för att räkna ut rabatt etc.
                var subtotal = double.Parse(Amount.Text);
                var Receipt = new Receipt.Model.Receipt(subtotal);
                Receipt.Calculate(subtotal);

                //Gör placeholdern synlig
                ReceiptPlaceHolder.Visible = true;
                
                //Sätter label-kontrollernas text-egenskaper
                SubTotal.Text = String.Format(SubTotal.Text, Receipt.Subtotal);
                DiscountRate.Text = String.Format(DiscountRate.Text, Receipt.DiscountRate);
                MoneyOff.Text = String.Format(MoneyOff.Text, Receipt.MoneyOff);
                Total.Text = String.Format(Total.Text, Receipt.Total);
            }
        }
    }
}
