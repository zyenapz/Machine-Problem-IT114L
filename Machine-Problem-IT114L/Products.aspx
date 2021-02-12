<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="MP_Prototype.WebForm2" StylesheetTheme="Red" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title">
        <h1>Browse Products</h1>
    </div>
    <div>

        Filter:

        <asp:DropDownList ID="listFilter" runat="server" AutoPostBack="True">
            <asp:ListItem>All</asp:ListItem>
            <asp:ListItem>Monitor</asp:ListItem>
            <asp:ListItem>Keyboard</asp:ListItem>
            <asp:ListItem>Mouse</asp:ListItem>
            <asp:ListItem>Cables</asp:ListItem>
            <asp:ListItem>System Unit</asp:ListItem>
            <asp:ListItem>Processor</asp:ListItem>
        </asp:DropDownList>

    </div>
    <div>

        <asp:GridView ID="dgvProducts" runat="server">
            <Columns>
                <asp:BoundField DataField="Product_ID" HeaderText="Product ID" SortExpression="Product_ID" />
                <asp:BoundField DataField="Product_Name" HeaderText="Product Name" SortExpression="Product_Name" />
                <asp:BoundField DataField="Product_Desc" HeaderText="Description" SortExpression="Product_Desc" />
                <asp:BoundField DataField="Trader_Name" HeaderText="Trader Name" SortExpression="Trader_Name" />
                <asp:BoundField DataField="Trader_ContactNum" HeaderText="Contact Number" SortExpression="Trader_ContactNum" />
                <asp:BoundField DataField="Trader_Email" HeaderText="Email" SortExpression="Trader_Email" />
                <asp:BoundField DataField="Product_Categ" HeaderText="Category" SortExpression="Product_Categ" />
            </Columns>
        </asp:GridView>
        <br />
        Enter Product ID:
        <asp:TextBox ID="txtAddID" runat="server" Width="136px"></asp:TextBox>
        <br /><br />
        <asp:Button ID="btnAdd" runat="server" Height="41px" OnClick="btnAdd_Click" Text="Add to Cart" Width="98px" Font-Size="" />
        <asp:Button ID="btnCancel" runat="server" Height="41px" OnClick="btnCancel_Click" Text="Cancel" Width="98px" Font-Size="" />
    </div>
</asp:Content>
