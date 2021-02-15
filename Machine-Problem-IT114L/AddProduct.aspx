<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="MP_Prototype.WebForm8" StylesheetTheme ="Red" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 49%;
            height: 385px;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style3">
        Add Products
    </div>
    <table class="auto-style2">
        <tr>
            <td>Product Name:</td>
            <td>
                <asp:TextBox ID="txtName" runat="server" Width="190px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Product Description:</td>
            <td>
                <asp:TextBox ID="txtDesc" runat="server" Height="73px" TextMode="MultiLine" Width="292px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Category:</td>
            <td>
                <asp:DropDownList ID="listCateg" runat="server">
                    <asp:ListItem>Monitor</asp:ListItem>
                    <asp:ListItem>Keyboard</asp:ListItem>
                    <asp:ListItem>Mouse</asp:ListItem>
                    <asp:ListItem>Cables</asp:ListItem>
                    <asp:ListItem>System Unit</asp:ListItem>
                    <asp:ListItem>Processor</asp:ListItem>
                </asp:DropDownList>
                (For sample purposes)</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAdd" runat="server" Height="34px" OnClick="btnAdd_Click" Text="Add" Width="86px" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Height="34px" Text="Cancel" Width="86px" OnClick="btnCancel_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
