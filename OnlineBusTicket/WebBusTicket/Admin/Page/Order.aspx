<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Page/Admin.master" AutoEventWireup="true"
    CodeFile="Order.aspx.cs" Inherits="Admin_Page_Order" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="Server">
    Order
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    Order
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="Server">
    <!-- Heading  -->
    <div class="row">
        <div class="span12">
            <h1>
                Orders</h1>
            <hr />
        </div>
    </div>
    <!--  End Heading -->
    <div class="row">
        <!-- Filter -->
        <div class="span4">
            <!-- Filter -->
            <div class="form-horizontal well">
                <legend>Filter Orders</legend>
                <asp:DropDownList Style="width: 100%" ID="ddlFilter" runat="server" 
                    AutoPostBack="True" onselectedindexchanged="ddlFilter_SelectedIndexChanged">
                    <asp:ListItem Value="0">-- View All Orders -- </asp:ListItem>
                    <asp:ListItem Value="1">View Only Pending Orders</asp:ListItem>
                    <asp:ListItem Value="2">View Only Delivered Orders</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <!-- End Filter -->
        <!-- Search -->
        <div class="span8">
            <div class="form-horizontal form-search well">
                <legend>Search Orders</legend>
                <asp:DropDownList ID="ddlSearch" runat="server" class="span3">
                    <asp:ListItem Value="3">Order ID</asp:ListItem>
                    <asp:ListItem Value="4">Customer Name</asp:ListItem>
                    <asp:ListItem Value="5">Customer Email</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtSearch" runat="server" type="text" class="" />
                <asp:Button runat="server" ID="btnSubmit" type="submit" class="btn " 
                    Text="Search" onclick="btnSubmit_Click">
                </asp:Button>
            </div>
        </div>
        <!-- End Search -->
    </div>
    <!-- End Row  -->
    <!-- List Orders  -->
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
                <cc1:CollectionPager ID="collectionPager" runat="server" ResultsLocation="None" BackNextLocation="Split"
                    BackText="Prev" PageSize="5" ShowLabel="False" 
                    BackNextDisplay="HyperLinks" BackNextLinkSeparator="." 
                    BackNextStyle="padding: 0 20px" NextText="Next" EnableViewState="False" 
                    UseSlider="True" >
                </cc1:CollectionPager>
            </div>
        </div>
    </div>
    <!-- End List Orders  -->
</asp:Content>
