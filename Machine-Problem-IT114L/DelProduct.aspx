<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="DelProduct.aspx.cs" Inherits="MP_Prototype.WebForm9" StylesheetTheme="Red" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: 51%;
            height: 230px;
        }
        .auto-style4 {
            height: 58px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style2">

        Delete Product</div>
    <div>

        <table class="auto-style3">
            <tr>
                <td class="auto-style4">Product ID:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtID" runat="server" Width="174px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnDel" runat="server" Height="33px" OnClick="btnDel_Click" Text="Delete" Width="100px" />
&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Height="33px" OnClick="btnCancel_Click" Text="Cancel" Width="100px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>
