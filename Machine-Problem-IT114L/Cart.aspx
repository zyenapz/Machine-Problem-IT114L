<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MP_Prototype.WebForm4" StylesheetTheme="Red" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title">
        <h1>My Cart</h1>
    </div>
    <div>

        <asp:GridView ID="dgvCart" runat="server">
            <Columns>
                <asp:BoundField DataField="Product_ID" HeaderText="Product ID" SortExpression="Product_ID" />
                <asp:BoundField DataField="Product_Name" HeaderText="Product Name" SortExpression="Product_Name" />
                <asp:BoundField DataField="Seller_ID" HeaderText="Seller ID" SortExpression="Seller_ID" />
                <asp:BoundField DataField="Seller_Name" HeaderText="Seller Name" SortExpression="Seller_Name" />
                <asp:BoundField DataField="Seller_ContactNum" HeaderText="Contact Number" SortExpression="Seller_ContactNum" />
                <asp:BoundField DataField="Seller_Email" HeaderText="Email Address" SortExpression="Seller_Email" />
            </Columns>
        </asp:GridView>
        <br />
        Product to Take<br />
        Enter Product ID:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtTake" runat="server"></asp:TextBox>
        <br />
        Product to Give<br />
        Enter Product ID:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtGive" runat="server"></asp:TextBox>
        <br />
        Shipping:&nbsp;&nbsp;
        <asp:DropDownList ID="listShip" runat="server">
            <asp:ListItem Value="Meet Up">Meet Up</asp:ListItem>
            <asp:ListItem Value="Delivery">Delivery</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnReq" runat="server" Height="33px" OnClick="btnReq_Click" Text="Send Request" Width="115px" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server" Height="33px" OnClick="btnCancel_Click" Text="Cancel" Width="115px" />

    </div>
</asp:Content>
