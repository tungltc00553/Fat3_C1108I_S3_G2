<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SeatDetail.aspx.cs" Inherits="SeatDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    » <a href="#">Seat</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="Server">
    <h2>
        <asp:Label ID="lblRoutesName" runat="server"></asp:Label></h2>
    <div id="seat">
        <asp:Repeater ID="rptSeat" runat="server">
            <ItemTemplate>
                <div class="seat-item">
                    <span></span>
                    <asp:CheckBox ID="cb" runat="server" Text='<%# Eval("NumberSeat") %>' Checked='<%# Eval("Status") %>'
                        Enabled='<%# !(bool)Eval("Status") %>' />
                </div>
                <!-- End .seat-item -->
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!-- End #seat -->
    <div class="info-listbus">
        <div class="info-bus">
            Bus plate:<span><asp:Label ID="lblBusPlate" runat="server"></asp:Label></span></div>
        <div class="info-bus">
            Departure:<span><asp:Label ID="lblDeparture" runat="server"></asp:Label></span></div>
        <div class="info-bus">
            Arrival:<span><asp:Label ID="lblArrival" runat="server"></asp:Label></span></div>
        <div class="info-bus">
            Start time:<span><asp:Label ID="lblStartTime" runat="server"></asp:Label></span></div>
        <div class="info-bus">
            Price:<span><asp:Label ID="lblPrice" runat="server"></asp:Label></span></div>
        <div class="info-bus">
            Type:<span><asp:Label ID="lblTypeName" runat="server"></asp:Label></span></div>
    </div>
    <!-- End #info-listbus -->
    <div class="cart-total">
        <div class="form_row">
            <asp:Button ID="btnBack" runat="server" CssClass="register" Text="Back" 
                OnClick="btnBack_Click" />
            <asp:Button ID="btnNext" runat="server" CssClass="register" Text="Next" OnClick="btnNext_Click" />
        </div>
    </div>
</asp:Content>
