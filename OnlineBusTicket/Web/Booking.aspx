<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Booking.aspx.cs" Inherits="Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Seat
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    » <a href="#">Booking</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="Server">
    <h2>
        <asp:Label ID="lblRoutesName" runat="server"></asp:Label></h2>
    <div class="contact_form">
        <div class="form_subtitle">
            Customer info</div>
        <div class="form_row">
            <label class="contact">
                <strong>Customer name: </strong>
            </label>
            <asp:TextBox ID="txtCustomerName" runat="server" CssClass="contact_input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerName"
                ErrorMessage="(*)"></asp:RequiredFieldValidator>
        </div>
        <div class="form_row">
            <label class="contact">
                <strong>Age:</strong></label>
            <asp:TextBox ID="txtAge" runat="server" CssClass="contact_input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAge"
                ErrorMessage="(*)"></asp:RequiredFieldValidator>
        </div>
        <div class="form_row">
            <label class="contact">
                <strong>Phone:</strong></label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="contact_input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone"
                ErrorMessage="(*)"></asp:RequiredFieldValidator>
        </div>
        <div class="form_row">
            <label class="contact">
                <strong>Email:</strong></label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="contact_input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="(*)"></asp:RequiredFieldValidator>
        </div>
        <div class="form_row">
            <label class="contact">
                <strong>Address:</strong></label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="contact_input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress"
                ErrorMessage="(*)"></asp:RequiredFieldValidator>
        </div>
        <div class="form_row">
            <asp:Label ID="lblThongbao" runat="server"></asp:Label>
        </div>
    </div>
    
    <div class="cart-total">
        <div class="form_row">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="register" />
            <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="register" 
                onclick="btnNext_Click" />
        </div>
    </div>
</asp:Content>
