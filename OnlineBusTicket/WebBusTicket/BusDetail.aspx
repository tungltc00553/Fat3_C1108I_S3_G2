<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="BusDetail.aspx.cs" Inherits="BusDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="Server">
    <h2>
        Seat detail</h2>
    <div id="detail">
        <div id="detail-image">
            <img src="images/bus/1.jpg" />
        </div>
        <!-- End #detail-image -->
        <div id="detail-info">
            <h3>
                <asp:Label ID="lblRoutesName" runat="server"></asp:Label></h3>
            <ul>
                <li><span class="info">Bus plate:</span>
                    <asp:Label ID="lblBusPlate" runat="server"></asp:Label></li>
                <li><span class="info">Departure:</span>
                    <asp:Label ID="lblDeparture" runat="server"></asp:Label></li>
                <li><span class="info">Arrival:</span>
                    <asp:Label ID="lblArrival" runat="server"></asp:Label></li>
                <li><span class="info">Price:</span>
                    <asp:Label ID="lblPrice" runat="server"></asp:Label>$</li>
                <li><span class="info">Start time:</span>
                    <asp:Label ID="lblStartTime" runat="server"></asp:Label></li>
            </ul>
        </div>
        <!-- End #detail-info -->
    </div>
    <!-- End #detail -->
    <div id="seat">
        <h3>
            Choise Seat</h3>
        <asp:Repeater ID="rptSeat" runat="server">
            <ItemTemplate>
                <div>
                    <asp:CheckBox ID="cb" runat="server" Text='<%# Eval("NumberSeat") %>' Checked='<%# Eval("Status") %>'
                        Enabled='<%# !(bool)Eval("Status") %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!-- End #seat -->
    <div id="submit">
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Add to cart »" CssClass="button2 fr" />
            <asp:Button ID="btnReset" runat="server" Text="Reset »" CssClass="button2 fr" /></div>
    </div>
    <!-- End #submit -->
</asp:Content>
