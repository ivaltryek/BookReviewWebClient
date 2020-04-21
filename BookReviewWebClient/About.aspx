<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="BookReviewWebClient.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>ReviewIt.</h3>
    <p>Web client for the <a href="https://github.com/meet86/BookReviewWCFService">BookReviewService</a> which is created in WCF, which serves the Common book reviewing and basic functionality purpose.
        i.e See others review, Posting a review, Editing a review and deleting it. 
    </p>
</asp:Content>
