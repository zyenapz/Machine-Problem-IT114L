<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="MP_Prototype.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 34px;
        }
        .auto-style4 {
            width: 252px;
        }
        .auto-style5 {
            height: 23px;
            width: 252px;
        }
        .auto-style6 {
            height: 34px;
            width: 252px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            SIGN UP</div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">First Name:</td>
                    <td>
                        <asp:TextBox ID="txtFirst" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Last Name:</td>
                    <td>
                        <asp:TextBox ID="txtLast" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Address:</td>
                    <td>
                        <asp:TextBox ID="txtAdd" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Contact Number:</td>
                    <td>
                        <asp:TextBox ID="txtNum" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Email Address:</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Password:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Confirm Password:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPassConfirm" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Button ID="btnSignUp" runat="server" OnClick="btnSignUp_Click" Text="Sign Up" />
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                    <td class="auto-style3"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
