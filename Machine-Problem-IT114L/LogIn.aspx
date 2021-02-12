<%@ Page Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="MP_Prototype.LogIn" StylesheetTheme="Red" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        hr {
            border: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNavbar" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div>
            <h1>Login</h1>
        </div>
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
                        <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" Height="41px" Width="116px" Font-Size="Large" />
        &nbsp;&nbsp;&nbsp;
                        </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <br />
        <div>

            Don&#39;t have an account yet? <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up Here!</asp:HyperLink>

        </div>
    </div>
</asp:Content>
