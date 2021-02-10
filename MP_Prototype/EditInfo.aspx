<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="EditInfo.aspx.cs" Inherits="MP_Prototype.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style3 {
        width: 26%;
        height: 441px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table class="auto-style3">
            <tr>
                <td class="auto-style2">
                    <asp:Image ID="Image1" runat="server" BorderStyle="Solid" Height="153px" ImageUrl="Images/DefaultPhoto.jpg" Width="160px" />
                    <asp:FileUpload ID="ImgUpload" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    First name:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtFirst" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    Last Name:&nbsp;&nbsp;
                    <asp:TextBox ID="txtLast" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Address:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtAdd" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    Contact Number:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtNum" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Email Address:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Current Password:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCurrPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>New Password:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Confirm New Password:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtConfirmNew" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" Height="38px" OnClick="btnSave_Click" Text="Save" Width="118px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
