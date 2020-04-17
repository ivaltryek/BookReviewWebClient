<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PostReview.aspx.cs" Inherits="BookReviewWebClient.Reviews.PostReview" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid">
        <div class ="container">
            <h4 class ="display-4" > Post a Review For <%= Session["ReviewBookName"].ToString() %> </h4>
        </div>
        <div class="container">
            <div class="form-group">
                <label for="reviewScale">Review Scale (1-10)</label><br />
                <asp:DropDownList CssClass="dropdown"  ID="scaleDropdown" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>

            </div>
            <asp:Label ID="previousScaleLbl" runat="server" Text=""></asp:Label>
            <br />
            <div class="form-group">
                <label for="reviewComment">Review Comment</label>
                <asp:TextBox ID="reviewCommentTxt" runat="server" CssClass="form-control"  TextMode="multiline" Columns="50" Rows="10" Height="159px" Width="312px"></asp:TextBox>

            </div>
             <asp:Label ID="previousCommentLbl" runat="server" Text=""></asp:Label><br />
            <br />
            <div class ="form-group">
                <asp:Button ID="postReviewBtn" CssClass="btn btn-primary" runat="server" Text="Post Review" OnClick="postReviewBtn_Click" /> &nbsp; &nbsp;  
                <%if (editFlag)
                    { %><asp:Button ID="deleteBtn" CssClass="btn btn-danger" runat="server" Text="Delete Review?" OnClick="deleteBtn_Click" /><%} %>
                
                <br />
                <asp:Label ID="errLbl" runat="server" CssClass="alert-danger"></asp:Label>
                <br />
                <asp:Label ID="tipLbl" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <hr />
    <div class="container">
        <h4 class ="display-4"> What others think about this book </h4>
        <h3><%=message %></h3>
        <% try
            {%>
        <% foreach (var i in reviewList)
            {
            %>
        <span class="text-primary""><%= i.ReviewBy %></span><br />
         Scale: <%= i.ReviewScale %><br />
         Comment: <%= i.ReviewComment %><br />
        <hr />
        <%} %>
        <%} %>
        <%catch (Exception) { } %>
    </div>
</asp:Content>
