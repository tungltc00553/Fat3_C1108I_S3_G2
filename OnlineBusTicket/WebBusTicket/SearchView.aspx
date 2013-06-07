<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SearchView.aspx.cs" Inherits="SearchView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    » <a href="#">Search view</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="Server">
    <h2>
        Search View</h2>
    <div id="search-view">
        <asp:GridView ID="grvListBus" runat="server" AutoGenerateColumns="False" Width="644px"
            OnRowCommand="grvListBus_RowCommand" CssClass="tbl">
            <Columns>
                <asp:BoundField DataField="ListBusId" HeaderText="List Bus #" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle CssClass="th" />
                    <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Bus Name" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Eval("BusName") %>
                    </ItemTemplate>
                    <HeaderStyle CssClass="th" />
                    <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Departure" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Eval("Departure")%>
                    </ItemTemplate>
                    <HeaderStyle CssClass="th" />
                    <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Arrival" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Eval("Arrival")%>
                    </ItemTemplate>
                    <HeaderStyle CssClass="th" />
                    <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Eval("Price")%>
                    </ItemTemplate>
                    <HeaderStyle CssClass="th" />
                    <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Seat" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Eval("Seat")%>
                    </ItemTemplate>
                    <HeaderStyle CssClass="th" />
                    <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                </asp:TemplateField>
                <asp:ButtonField CommandName="View" Text="View" HeaderText="View" ItemStyle-HorizontalAlign="Center">
                    <ControlStyle ForeColor="#FFCC00" />
                    <HeaderStyle CssClass="th" />
                    <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                </asp:ButtonField>
            </Columns>
        </asp:GridView>
    </div>
    <!-- End #search-view-->
</asp:Content>
