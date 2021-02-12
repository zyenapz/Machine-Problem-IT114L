<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="MP_Prototype.WebForm3" StylesheetTheme="Red" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        height: 23px;
        text-align: center;
    }
    .auto-style3 {
        width: 26%;
        height: 441px;
    }
    .auto-style4 {
        height: 49px;
        text-align: center;
    }
    .auto-style5 {
        height: 61px;
        text-align: center;
    }
    .auto-style6 {
        height: 54px;
    }
    .auto-style7 {
        height: 57px;
    }
        .auto-style8 {
            width: 48%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="title">
            <h1>My Account</h1>
        </div>
        <table class="auto-style3">
            <tr>
                <td class="auto-style2">
                    <asp:Image ID="imgProfile" runat="server" BorderStyle="Solid" Height="153px" Width="160px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblID" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Contact Information:</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
                &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblNum" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnEdit" runat="server" Height="32px" OnClick="btnEdit_Click" Text="Edit" Width="79px" />
                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnLogOut" runat="server" Height="31px" OnClick="btnLogOut_Click" Text="Log Out" Width="96px" />
                </td>
            </tr>
        </table>
        <br />
        My Products:<asp:GridView ID="dgvMyProducts" runat="server">
            <Columns>
                <asp:BoundField DataField="Product_ID" HeaderText="Product ID" SortExpression="Product_ID" />
                <asp:BoundField DataField="Product_Name" HeaderText="Product Name" SortExpression="Product_Name" />
                <asp:BoundField DataField="Product_Desc" HeaderText="Description" SortExpression="Product_Desc" />
                <asp:BoundField DataField="Product_Categ" HeaderText="Category" SortExpression="Product_Categ" />
            </Columns>
        </asp:GridView>

        <br />
        <asp:Button ID="btnAdd" runat="server" Height="43px" OnClick="btnAdd_Click" Text="Add" Width="102px" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnDel" runat="server" Height="43px" OnClick="btnDel_Click" Text="Delete" Width="102px" />
        <br />
        <br />
        Requests to me:<br />
        <asp:GridView ID="dgvReqs" runat="server">
            <Columns>
                <asp:BoundField DataField="Request_ID" HeaderText="Request ID" SortExpression="Request_ID" />
                <asp:BoundField DataField="Product_Take" HeaderText="Product Requested" SortExpression="Product_Take" />
                <asp:BoundField DataField="Requester_ID" HeaderText="Requester ID" SortExpression="Requester_ID" />
                <asp:BoundField DataField="Product_Give" HeaderText="Product to Trade back" SortExpression="Product_Give" />
                <asp:BoundField DataField="Product_Desc" HeaderText="Product Description" SortExpression="Product_Desc" />
                <asp:BoundField DataField="Shipping" HeaderText="Shipping" SortExpression="Shipping" />
            </Columns>
        </asp:GridView>
        <br />
        <table class="auto-style8">
            <tr>
                <td>Request ID:</td>
                <td>
                    <asp:TextBox ID="txtReqID" runat="server" Width="179px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnAccept" runat="server" Height="39px" Text="Accept" Width="108px" OnClick="btnAccept_Click" />
&nbsp;&nbsp;
        <asp:Button ID="btnDecline" runat="server" Height="39px" Text="Decline" Width="108px" OnClick="btnDecline_Click" />
        &nbsp;<br />

    </div>
</asp:Content>
