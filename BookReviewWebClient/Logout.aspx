<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="BookReviewWebClient.Logout" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h3 class="display-4">Are you sure you want to Logout?</h3>
            <p class="lead">Clicking on logout will log you out, click on cancel to prevent this action.</p>
        </div>
        <div class="container">
           
                
                    <asp:Button ID="logoutBtn" CssClass="btn btn-danger" runat="server"
                        Text="Logout" OnClick="logoutBtn_Click" />
                    &nbsp;
                        <asp:Button ID="cancelBtn" CssClass="btn btn-primary" runat="server" 
                        Text="Cancel" OnClick="cancelBtn_Click" />

               
           
        </div>
    </div>

</asp:Content>
