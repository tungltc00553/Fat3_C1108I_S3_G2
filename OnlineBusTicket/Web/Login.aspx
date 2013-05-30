<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">
» <a href="#">Login</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <div class="contact_form">
        <div class="form_subtitle">
           Login</div>
        <div class="form_row">
            <label class="contact">
                <strong>Username:</strong></label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="contact_input"></asp:TextBox>
        </div>
        <div class="form_row">
            <label class="contact">
                <strong>Password:</strong></label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="contact_input" 
                TextMode="Password"></asp:TextBox>
        </div>
        <div class="form_row">
            <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="register" 
                onclick="btnSubmit_Click"/>
        </div>
        <div class="form_row">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

