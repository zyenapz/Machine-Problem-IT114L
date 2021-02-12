<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="EditInfo.aspx.cs" Inherits="MP_Prototype.WebForm7" StylesheetTheme="Red" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style3 {
        width: 89%;
        height: 441px;
    }
        .auto-style4 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table class="auto-style3">
            <tr>
                <td class="auto-style2">
                    <asp:Image ID="Image1" runat="server" BorderStyle="Solid" Height="153px" ImageUrl="Images/DefaultPhoto.jpg" Width="160px" />
                    <br />
                    <asp:FileUpload ID="ImgUpload" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    First name:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtFirst" runat="server" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvfirstname" runat="server" ControlToValidate="txtFirst" ErrorMessage="Enter a first name!" Font-Bold="False" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    Last Name:&nbsp;&nbsp;
                    <asp:TextBox ID="txtLast" runat="server" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvlastname" runat="server" ControlToValidate="txtLast" ErrorMessage="Enter a last name!" Font-Bold="False" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Address:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtAdd" runat="server" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvaddress" runat="server" ControlToValidate="txtAdd" ErrorMessage="Enter an address!" Font-Bold="False" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    Contact Number:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtNum" runat="server" MaxLength="11"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvaddress0" runat="server" ControlToValidate="txtAdd" ErrorMessage="Enter a phone number!" Font-Bold="False" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;
                    <asp:CompareValidator ID="cvphonenumber" runat="server" ControlToValidate="txtNum" ErrorMessage="Letters not allowed!" Font-Italic="True" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Email Address:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter an email!" Font-Bold="False" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Password:</td>
            </tr>
            <tr>
                <td>Current Password:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCurrPass" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvcurrpas" runat="server" ControlToValidate="txtCurrPass" ErrorMessage="Enter your current password!" Font-Bold="False" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>New Password:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvnewpass" runat="server" ControlToValidate="txtNewPass" ErrorMessage="Enter your new password!" Font-Bold="False" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Confirm New Password:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtConfirmNew" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvconfirm" runat="server" ControlToValidate="txtConfirmNew" ErrorMessage="Confirm your new password!" Font-Bold="False" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" Height="38px" OnClick="btnSave_Click" Text="Save" Width="118px" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
