<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="TicketReturnEmp.aspx.cs" Inherits="TicketReturnEmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="Server">
    <h2>
        <asp:Label ID="lblRoutesName" runat="server"></asp:Label></h2>
    <div class="contact_form">
        <div class="form_subtitle">
            Ticket return</div>
        <div class="form_row">
            <label class="contact">
                <strong>List bus id: </strong>
            </label>
            <asp:TextBox ID="txtListBusId" runat="server" CssClass="contact_input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtListBusId"
                ErrorMessage="(*)"></asp:RequiredFieldValidator>
        </div>
        <div class="form_row">
            <label class="contact">
                <strong>Number seat:</strong></label>
            <asp:TextBox ID="txtNumberSeat" runat="server" CssClass="contact_input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNumberSeat"
                ErrorMessage="(*)"></asp:RequiredFieldValidator>
        </div>
        <div class="form_row">
            <label class="contact">
                <strong>Percent price:</strong></label>
            <asp:TextBox ID="txtPercentPrice" runat="server" CssClass="contact_input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPercentPrice"
                ErrorMessage="(*)"></asp:RequiredFieldValidator>
        </div>
        <div class="form_row">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </div>
    <div class="cart-total">
        <div class="form_row">
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="register" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="register" 
                onclick="btnSave_Click" />
        </div>
    </div>
</asp:Content>
