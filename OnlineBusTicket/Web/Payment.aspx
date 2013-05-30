<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="Server">
    <h2>
        <asp:Label ID="lblHeader" runat="server"></asp:Label></h2>
    <asp:GridView ID="grvCart" runat="server" AutoGenerateColumns="False" CellPadding="4"
        ForeColor="Black" GridLines="Horizontal" Width="644px" 
        DataKeyNames="ListBusId" BackColor="White" BorderColor="#CCCCCC" 
        BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:BoundField DataField="ListBusId" HeaderText="List Bus Id" ItemStyle-HorizontalAlign="Center"
                ReadOnly="True">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Number Seat" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Eval("NumberSeat") %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Eval("Fees") %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Promote Id" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Eval("PromoteId") %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <div class="info-listbus">
        <div class="info-bus">
            Customer name:<span><asp:Label ID="lblCustomerName" runat="server"></asp:Label></span></div>
        <div class="info-bus">
            Age:<span><asp:Label ID="lblAge" runat="server"></asp:Label></span></div>
        <div class="info-bus">
            Phone:<span><asp:Label ID="lblPhone" runat="server"></asp:Label></span></div>
        <div class="info-bus">
            Email:<span><asp:Label ID="lblEmail" runat="server"></asp:Label></span></div>
    </div>
    <div class="info-listbus">
        <div class="info-bus">
            Discount:<span><asp:Label ID="lblDiscount" runat="server"></asp:Label></span></div>
        <div class="info-bus">
            Total fees:<span><asp:Label ID="lblTotalFees" runat="server"></asp:Label></span></div>
    </div>
    <div class="cart-total">
        <div class="form_row">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="register" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="register" 
                onclick="btnSave_Click" />
        </div>
    </div>
</asp:Content>
