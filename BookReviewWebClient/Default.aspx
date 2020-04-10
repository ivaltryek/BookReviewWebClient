<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BookReviewWebClient._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-4">
          
              <div class ="jumbotron ">
                  ReviewIt made it easy just it takes 3 steps to a review a book.<br />
                  First: Search It <br />
                  Second:  Write A review <br />
                  Third: Post a review <br />

                  <br />
                  Done.!!<br />
                  <asp:Button ID="registerBtn" CssClass="btn btn-primary" runat="server" Text="Register Now >>" OnClick="registerBtn_Click" />
              </div>
           
        </div> <hr />
        <div class ="jumbotron jumbotron-fluid ">
            Search Book to Review:
            <asp:Label ID="tipLbl" runat="server" CssClass="alert-danger"></asp:Label>
            <asp:TextBox ID="searchTxt" CssClass="form-control" runat="server" Width="463px"></asp:TextBox><br />
            <asp:Button ID="searchBtn" CssClass="btn btn-success" runat="server" Text="Search" OnClick="searchBtn_Click" />
        </div>    
    </div>

</asp:Content>
