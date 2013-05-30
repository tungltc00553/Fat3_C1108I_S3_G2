<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    » <a href="#">Search</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="Server">
    <asp:GridView ID="grvListBus" runat="server" AutoGenerateColumns="False" Width="644px"
        BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
        CellPadding="3" ForeColor="Black" GridLines="Vertical" 
        onrowcommand="grvListBus_RowCommand">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="ListBusId" HeaderText="List Bus Id" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Bus Name" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Eval("BusName") %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Departure" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Eval("Departure")%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Arrival" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Eval("Arrival")%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Eval("Price")%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Seat" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Eval("Seat")%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:ButtonField CommandName="View" Text="View" HeaderText="View" 
                ItemStyle-HorizontalAlign="Center" >
            <ControlStyle ForeColor="#FFCC00" />
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:ButtonField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
</asp:Content>


