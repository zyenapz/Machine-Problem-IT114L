<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="MP_Prototype.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 255px;
        }
        .auto-style3 {
            width: 255px;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Log In</div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">User ID / Contact Number:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtIdNum" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password:</td>
                    <td>
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" />
&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div>

            Don&#39;t have an account yet? <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignIn.aspx">Sign Up Here!</asp:HyperLink>

        </div>
    </form>
</body>
</html>
