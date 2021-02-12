<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="MP_Prototype.WebForm6" StylesheetTheme="Red" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            margin-left: 40px;
        }
        .contacts {
            display: flex;
            flex-direction: row;
        }
        .contact-item {
            flex-grow: 1;
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title">
        <h1>Contact Us</h1>
    </div>
    <div class="contacts">
        <div class="contact-item">
            <div>
                <asp:Label ID="Label11" runat="server" Text="E-mail Us" Font-Size="X-Large" Font-Bold="true"></asp:Label>
            </div>
            <div>
                <asp:Label ID="Label1" runat="server" Text="Name:" ></asp:Label>
                <asp:TextBox ID="txtName" runat="server" Height="20px" Width="192px" Font-Size="Large" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="red" Font-Size="Large"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div>
                <asp:Label ID="Label2" runat="server" Text="E-mail:" ></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" Height="20px" Width="192px" Font-Size="Large" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="red" Font-Size="Large"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div>
                <asp:Label ID="Label3" runat="server" Text="Phone no.:" ></asp:Label>
                <asp:TextBox ID="txtPhoneNo" runat="server" Height="20px" Width="192px" Font-Size="Large" MaxLength="11"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhoneNo" ErrorMessage="*" ForeColor="red" Font-Size="Large"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label5" runat="server" Text="We will only call you if needed." Font-Size="Small"></asp:Label>
            </div>
            <br />
            <div>
                <asp:Label ID="Label4" runat="server" Text="Subject:"></asp:Label>

                <asp:DropDownList ID="drpSubject" runat="server" Height="24px" Width="192px" Font-Size="Large">
                    <asp:ListItem>Partnership</asp:ListItem>
                    <asp:ListItem>Website Inquiry</asp:ListItem>
                    <asp:ListItem>General Inquiry</asp:ListItem>
                    <asp:ListItem>Website Error</asp:ListItem>
                    <asp:ListItem>Commendation</asp:ListItem>
                    <asp:ListItem>Complaint</asp:ListItem>
                </asp:DropDownList>

            </div>
            <br />
            <div>
                <asp:TextBox ID="txtMessage" runat="server" Height="169px" Width="404px" Placeholder="Type your message here... (200 character limit)" TextMode="MultiLine" MaxLength="200" Font-Size="Large"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMessage" ErrorMessage="Please type a message" ForeColor="red" Font-Size="Large"></asp:RequiredFieldValidator>
            </div>
            <asp:Label ID="LabelFeedback" runat="server" Font-Size="Large" Text="FEEDBACK GOES HERE" Visible="False"></asp:Label>
            <br />

            <asp:Button ID="btnSubmit" runat="server" Text="Send E-mail" Height="32px" Width="134px" Font-Size="Large" OnClick="btnSubmit_Click"/>
        </div>
        <div class="contact-item">
            <div>
                <asp:Label ID="Label6" runat="server" Text="Call Us" Font-Size="X-Large" Font-Bold="true"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="1-896-692-4202" style="padding: 0 10px 0"></asp:Label>
            </div>
            <div>
                <asp:Label ID="Label8" runat="server" Text="We are available at these times: "></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="Monday-Friday: 8am-6pm (GMT+8)"></asp:Label>
                <br />
                <asp:Label ID="Label10" runat="server" Text="Saturday-Sunday: 8am-12nn (GMT+8)"></asp:Label>
            </div>
        </div>
    </div>
    
</asp:Content>
