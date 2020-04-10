<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookReviewWebClient.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h4 class="display-4">Register Yourself</h4>
        </div>
        <div class="container">


            <div class="form-group">
                <label for="userNameTxt">Username</label>
                <asp:TextBox ID="userNameTxt" CssClass="form-control" runat="server" Width="298px" OnTextChanged="userNameTxt_TextChanged"></asp:TextBox>

                <asp:Label ID="Label1" runat="server" CssClass="alert-warning"></asp:Label><br />

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="userNameTxt" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Username is required."></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <label for="firstNameTxt">Firstname</label>
                <asp:TextBox ID="firstNameTxt" CssClass="form-control" runat="server" Width="298px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="firstNameTxt" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Firstname is required"></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <label for="lastNameTxt">Lastname</label>
                <asp:TextBox ID="lastNameTxt" CssClass="form-control" runat="server" Width="298px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lastNameTxt" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Lastname is requied."></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <label for="userEmailTxt">Email</label>
                <asp:TextBox ID="userEmailTxt" CssClass="form-control" runat="server" Width="298px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="userEmailTxt" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Email is required."></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <label for="passwordTxt">Password</label>
                <asp:TextBox ID="passwordTxt" TextMode="Password" CssClass="form-control" runat="server" Width="298px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="passwordTxt" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Password is required."></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <label for="cpasswordTxt">Confirm Password</label>
                <asp:TextBox ID="cpasswordTxt" TextMode="Password" CssClass="form-control" runat="server" Width="298px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="cpasswordTxt" CssClass="alert-warning" Display="Dynamic" ErrorMessage="Confirm password is requied."></asp:RequiredFieldValidator><br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords didn't matched!!" ControlToCompare="passwordTxt" ControlToValidate="cpasswordTxt" CssClass="alert-warning" Display="Dynamic"></asp:CompareValidator>

            </div>
            <div class="form-group">
                <asp:Button ID="registerBtn" CssClass="btn btn-info" runat="server" Text="Register" OnClick="registerBtn_Click" />

            </div>
            <br />
            <asp:Label ID="errorLbl" CssClass="alert-danger" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
