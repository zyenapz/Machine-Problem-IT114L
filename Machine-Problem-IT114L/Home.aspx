<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MP_Prototype.WebForm1" StylesheetTheme="Red" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .box-column {
            display: flex;
            flex-direction: column;
        }
        .box-row {
            display: flex;
            flex-direction: row;
        }
        .box-ads {
            flex-grow: 1;
            height: 100%;
        }
        .box-content {
            flex-grow: 10;
            height: 100%;
            width: 100%;
        }
        .centered-content {
            text-align: center;
        }
        .right-content {
            margin-left: auto; 
            margin-right: 0;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box-column">

        <div class="box-row">
            <div class="box-ads">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Content/Ads/Raid.jpg" Height="85%" Width="100%" />
            </div>
            <div class="title box-content">
                <div>
                    <h1>Featured Products</h1>
                    <asp:Label ID="LabelEmpty" runat="server" Text=""></asp:Label>
                    <asp:GridView ID="GridViewProducts" runat="server" ShowHeader="false" Width="100%" GridLines="None"></asp:GridView>
                </div>
                
            </div>
            <div class="box-ads right-content">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/Ads/YT_ad.jpg" Height="85%" Width="100%" />
            </div>
        </div>

        <div class="centered-content">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/Ads/Netflix.jpg" Height="288px" Width="100%" />
        </div>

    </div>
    
</asp:Content>
