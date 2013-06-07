<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Page/Admin.master" AutoEventWireup="true"
    CodeFile="Statistics.aspx.cs" Inherits="Admin_Page_Statistics" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="Server">
    Statistics</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    Statistics
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="Server">
    <!-- Heading  -->
    <div class="row">
        <div class="span12">
            <h1>
                Statistics</h1>
            <hr />
        </div>
    </div>
    <!--  End Heading -->
    <div class="row">
        <!-- Search -->
        <div class="span8">
            <div class="form-horizontal form-search well" style="width: 1000px">
                <legend>Ticket Top Day,Month,Year</legend>
                <asp:DropDownList ID="ddlTop" runat="server" class="span3" AutoPostBack="True" OnSelectedIndexChanged="ddlTop_SelectedIndexChanged">
                    <asp:ListItem Value="1">Top 10 Ticket</asp:ListItem>
                    <asp:ListItem Value="2">Top 10 Ticket Of Day</asp:ListItem>
                    <asp:ListItem Value="3">Top 10 Ticket Of Moth</asp:ListItem>
                    <asp:ListItem Value="4">Top 10 Ticket Of Year</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlMonth" runat="server" type="text" class="" Width="70px"
                    Visible="False" />
                <asp:DropDownList ID="ddlDay" runat="server" type="text" class="" Width="70px" Visible="False" />
                <asp:DropDownList ID="ddlYear" runat="server" type="text" class="" Width="70px" Visible="False" />
                <asp:DropDownList ID="ddlDay2" runat="server" type="text" class="" Width="70px" Visible="False" />
                <asp:Button runat="server" ID="btnSubmit" type="submit" class="btn " Text="Submit"
                    OnClick="btnSubmit_Click"></asp:Button>
            </div>
        </div>
        <!-- End Search -->
    </div>
    <div class="row">
        <div class="span12">
            <asp:GridView ID="grvListBus" runat="server" AutoGenerateColumns="False" Width="1170px"
                CssClass="table table-striped table-bordered hidden-phone-480-table" DataKeyNames="ListBusId">
                <Columns>
                    <asp:BoundField DataField="ListBusId" HeaderText="List Bus #" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Routes Name" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("RoutesName")%>
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
                    <asp:TemplateField HeaderText="Price" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("Price")%>$
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("Quantity")%>
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="span12">
            <!-- Pagination -->
            <div>
                <cc1:CollectionPager ID="collectionPager" runat="server" ResultsLocation="None" BackNextLocation="Split"
                    BackText="Prev" PageSize="5" ShowLabel="False" BackNextDisplay="HyperLinks" BackNextLinkSeparator="."
                    BackNextStyle="padding: 0 20px" NextText="Next" EnableViewState="False" UseSlider="True">
                </cc1:CollectionPager>
            </div>
        </div>
    </div>
    <!-- End List Orders  -->
    <div class="row">
        <!-- Block  -->
        <div class="span4 ">
            <h4>
                Total Orders</h4>
            <div class="well ">
                <ul class="nav nav-dotted nav-orders">
                    <li>
                        <div class="pull-left">
                            <div class="clearfix">
                            </div>
                            <label class="label label-success pull-left">
                                Total Order</label>
                            <div class="clearfix">
                            </div>
                            <span class="info">Quantity Seat:</span>
                            <asp:Label ID="lblTopSeat" runat="server" CssClass="info info-detail" Text=""></asp:Label>
                            <span class="info">Total Price:</span>
                            <asp:Label ID="lblTopPrice" runat="server" CssClass="info info-detail" Text=""></asp:Label>
                        </div>
                        <div class="clearfix">
                        </div>
                        <a href="#" class="btn btn-mini btn-block visible-phone btn-details">Details
                            <icon class="icon-arrow-right icon-brown"></icon>
                        </a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row">
        <!-- Search -->
        <div class="span8">
            <div class="form-horizontal form-search well" style="width: 1000px">
                <legend>Total Day,Month,Year</legend>
                <asp:DropDownList ID="ddlTotal" runat="server" class="span3" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlTotal_SelectedIndexChanged">
                    <asp:ListItem Value="0">-- All Order --</asp:ListItem>
                    <asp:ListItem Value="1">Total Day</asp:ListItem>
                    <asp:ListItem Value="2">Total Moth</asp:ListItem>
                    <asp:ListItem Value="3">Total Year</asp:ListItem>
                    <asp:ListItem Value="4">Total Between Day</asp:ListItem>
                    <asp:ListItem Value="5">Total Between Moth</asp:ListItem>
                    <asp:ListItem Value="6">Total Between Year</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlMonthOrder" runat="server" type="text" class="" Width="70px"
                    Visible="False" />
                <asp:DropDownList ID="ddlDayOrder" runat="server" type="text" class="" Width="70px"
                    Visible="False" />
                <asp:DropDownList ID="ddlDay2Order" runat="server" type="text" class="" Width="70px"
                    Visible="False" />
                <asp:DropDownList ID="ddlYearOrder" runat="server" type="text" class="" Width="70px"
                    Visible="False" />
                <asp:Button runat="server" ID="btnSubmitOrder" type="submit" class="btn " Text="Submit"
                    OnClick="btnSubmitOrder_Click"></asp:Button>
            </div>
        </div>
        <!-- End Search -->
    </div>
    <div class="row">
        <div class="span12">
            <asp:GridView ID="grvOrder" runat="server" AutoGenerateColumns="False" Width="1170px"
                CssClass="table table-striped table-bordered hidden-phone-480-table" 
                DataKeyNames="OrderId" 
                onselectedindexchanging="grvOrder_SelectedIndexChanging" 
                onrowcancelingedit="grvOrder_RowCancelingEdit" 
                onrowdeleting="grvOrder_RowDeleting" onrowediting="grvOrder_RowEditing" 
                onrowupdating="grvOrder_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="Order #" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("CreateDate")%>
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Customer" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("CustomerName")%>
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# (bool)Eval("Status")?"Delivered": "Pending"%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox ID="cbStatus" runat="server" Checked='<%# Eval("Status") %>'/>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Price" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("TotalFees")%>$
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lblUpdate" runat="server" CommandName="Edit">Update</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbtnOK" runat="server" CommandName="Update">Yes</asp:LinkButton>
                            <asp:LinkButton ID="lbtnHuy" runat="server" CommandName="Cancel">No</asp:LinkButton>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete ?" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <span onclick="return confirm('Delete ?')">
                                <asp:LinkButton ID="lbtnDel" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View Detail" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                             <asp:LinkButton ID="lblView" runat="server" CommandName="Select">View</asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle CssClass="tr" />
                        <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="span12">
            <!-- Pagination -->
            <div>
                <cc1:CollectionPager ID="collectionPagerOrder" runat="server" ResultsLocation="None"
                    BackNextLocation="Split" BackText="Prev" PageSize="5" ShowLabel="False" BackNextDisplay="HyperLinks"
                    BackNextLinkSeparator="." BackNextStyle="padding: 0 20px" NextText="Next" EnableViewState="False"
                    UseSlider="True">
                </cc1:CollectionPager>
            </div>
        </div>
    </div>
    <!-- End List Orders  -->
    <div class="row">
        <!-- Block  -->
        <div class="span4 ">
            <h4>
                Total Orders</h4>
            <div class="well ">
                <ul class="nav nav-dotted nav-orders">
                    <li>
                        <div class="pull-left">
                            <div class="clearfix">
                            </div>
                            <label class="label label-success pull-left">
                                Total Order</label>
                            <div class="clearfix">
                            </div>
                            <span class="info">Quantity Seat:</span>
                            <asp:Label ID="lblTotalQuantity" runat="server" CssClass="info info-detail" Text=""></asp:Label>
                            <span class="info">Total Price:</span>
                            <asp:Label ID="lblTotalPrice" runat="server" CssClass="info info-detail" Text=""></asp:Label>
                        </div>
                        <div class="clearfix">
                        </div>
                        <a href="#" class="btn btn-mini btn-block visible-phone btn-details">Details
                            <icon class="icon-arrow-right icon-brown"></icon>
                        </a></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
