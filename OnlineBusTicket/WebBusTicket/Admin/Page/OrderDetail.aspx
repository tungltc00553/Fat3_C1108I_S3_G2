<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Page/Admin.master" AutoEventWireup="true"
    CodeFile="OrderDetail.aspx.cs" Inherits="Admin_Page_OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="Server">
    Order detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    Order detail
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="Server">
    <!-- Heading  -->
    <div class="row">
        <div class="span12">
            <h1>
                Orders Detail</h1>
            <hr />
        </div>
    </div>
    <!--  End Heading -->
    <div class="row">
        <div class="span12">
            <asp:GridView ID="grvOrderDetail" runat="server" AutoGenerateColumns="False" Width="1170px"
                CssClass="table table-striped table-bordered hidden-phone-480-table" DataKeyNames="OrderDetailId">
                <Columns>
                    <asp:BoundField DataField="OrderDetailId" HeaderText="Order Detail #" ReadOnly="True" 
                        ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Number Seat" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("NumberSeat")%>
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bus Plate" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("BusPlate")%>
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" Routes Name" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("RoutesName")%>
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fees" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("Fees")%>$
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Departure" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("Departure")%>
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Arrival" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("Arrival")%>
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Discount" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("Discount")%>%
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="span12">
            <!-- Block  -->
            <div class="span4" style="width: 550px">
                <h4>
                    Billing Addresses</h4>
                <div class="well ">
                    <ul class="nav nav-dotted">
                        <li>Name <span class="info info-c ">
                            <asp:Label ID="lblName" runat="server" Text=""></asp:Label></span></li>
                        <li>Phone<span class="info info-c "> <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label></span></li>
                        <li>Email <span class="info info-c "> <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></span></li>
                        <li>Address <span class="info info-c "> <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label></span></li>
                    </ul>
                </div>
            </div>
            <!-- End Block  -->
            <!-- Block  -->
            <div class="span4" style="width: 550px">
                <h4>
                    Shipping Addresses</h4>
                <div class="well ">
                    <ul class="nav nav-dotted">
                        <li>Name <span class="info info-c "> <asp:Label ID="lblNameShip" runat="server" Text=""></asp:Label></span></li>
                        <li>Phone<span class="info info-c "> <asp:Label ID="lblPhoneShip" runat="server" Text=""></asp:Label></span></li>
                        <li>Email <span class="info info-c "> <asp:Label ID="lblEmailShip" runat="server" Text=""></asp:Label></span></li>
                        <li>Address <span class="info info-c "> <asp:Label ID="lblAddressShip" runat="server" Text=""></asp:Label></span></li>
                    </ul>
                </div>
            </div>
            <!-- End Block  -->
        </div>
</asp:Content>
