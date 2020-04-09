<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.cs" Inherits="BookReviewWebClient.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Login</h1>
            <p class="lead">Use your registered email address and corresponding password to login.</p>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="userEmailLabel">User Email</label>
                        <asp:TextBox ID="emailTxt" CssClass=" form-control " runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="userEmailValidator" runat="server" CssClass="alert-warning" ErrorMessage="User Email is required" ControlToValidate="emailTxt"></asp:RequiredFieldValidator>

                        <br />

                    </div>
                    <div class="form-group">
                        <label for="userPasswordLabel">User Password</label>
                        <asp:TextBox ID="passwordTxt" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="User Password field is required" ControlToValidate="passwordTxt" 
                        CssClass="alert-warning"></asp:RequiredFieldValidator>
                    <br />
                    <div class="form-group">
                        <asp:Button ID="logInNowBtn" CssClass="btn btn-primary" runat="server" 
                            Text="Log In Now" OnClick="logInNowBtn_Click" /> &nbsp;
                        <asp:Button ID="registerBtn" CssClass="btn btn-info"  runat="server" Text="Not Registered?" OnClick="registerBtn_Click" />
                        
                    </div>
                    
                        <asp:Label ID="errorLabel" CssClass="text-danger" runat="server" Text=""></asp:Label>
                    
                </div>
            </div>
        </div>
    </div>
    <br />




</asp:Content>
