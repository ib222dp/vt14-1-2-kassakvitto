<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Receipt.Default"
    ViewStateMode="Disabled" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kassakvitto</title>
    <link href="~/Content/receipt.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" defaultbutton="Compute">
    <div>
        <h1>
            Kassakvitto</h1>
        <%-- Köpesumma --%>
        <div id="receipt-label">
            <asp:Label ID="Label1" runat="server" AssociatedControlID="Amount" Text="Total köpesumma:"></asp:Label>
        </div>
        <div id="receipt-field">
            <asp:TextBox ID="Amount" runat="server" TextMode="SingleLine"></asp:TextBox>
            <%-- Validering --%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ange en total köpesumma!"
                ControlToValidate="Amount" Display="Dynamic" CssClass="field-validation-error"
                SetFocusOnError="true" Text="Ange en total köpesumma!"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Ange en total köpesumma större än 0!"
                ControlToValidate="Amount" Display="Dynamic" Operator="GreaterThan" Type="Double"
                CssClass="field-validation-error" SetFocusOnError="true" Text="Ange en total köpesumma större än 0!"
                ValueToCompare="0"></asp:CompareValidator>
        </div>
        <%-- Kommandoknapp --%>
        <asp:Button ID="Compute" runat="server" Text="Beräkna rabatt" OnClick="Compute_Click" />
        <%-- Resultat --%>
        <div class="receipt-result" runat="server">
            <asp:PlaceHolder ID="ReceiptPlaceHolder" runat="server" Visible="false">
                <asp:Label ID="SubTotal" runat="server">Totalt: {0:c}</asp:Label>
                <p>
                    <asp:Label ID="DiscountRate" runat="server">Rabattsats: {0:p0}</asp:Label>
                </p>
                <p>
                    <asp:Label ID="MoneyOff" runat="server">Rabatt: {0:c}</asp:Label>
                </p>
                <p>
                    <asp:Label ID="Total" runat="server">Att betala: {0:c}</asp:Label>
                </p>
            </asp:PlaceHolder>
        </div>
    </div>
    </form>
    <script src="Scripts/focus.js"> </script>
</body>
</html>
