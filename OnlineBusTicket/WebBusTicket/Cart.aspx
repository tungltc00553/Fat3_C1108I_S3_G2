<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link href="css/slideshow.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <%--<script src="js/jquery-1.8.3.js" type="text/javascript"></script>--%>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#slideshow').nivoSlider();
            $(".text").datepicker();
        });
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <div id="main-wrapper">
            <div id="header">
                <div id="htop">
                    <ul>
                        <li class="checkout-icon">
                            <asp:HyperLink ID="hplCheckout" runat="server" NavigateUrl="MyAccount.aspx?url=MyAccount">Checkout</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="hplCart" runat="server" NavigateUrl="Cart.aspx?url=cart">Cart</asp:HyperLink></li>
                        <li class="myaccount-icon">
                            <asp:HyperLink ID="hplMyAcount" runat="server" NavigateUrl="MyAccount.aspx?url=MyAccount">My Acount</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="hplLogin" runat="server" NavigateUrl="Login.aspx?url=Login">Login</asp:HyperLink></li>
                    </ul>
                </div>
                <!-- End #htop -->
                <div id="banner">
                    <h1>
                        <a href="#">Online Bus Ticket</a></h1>
                </div>
                <!-- End #banner -->
                <div id="top-nav">
                    <ul id="menu">
                        <li><a href="Home.aspx">Home</a></li>
                        <li><a href="Booking.aspx">Booking</a></li>
                        <li><a href="#">News</a></li>
                        <li><a href="#">FAQs</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                    <!-- End #menu -->
                </div>
                <!-- End #top-nav -->
            </div>
            <!-- End #header -->
            <div id="main-content">
                <h2 class="title">
                    Cart</h2>
                <div id="search-view">
                    <asp:GridView ID="grvListBus" runat="server" AutoGenerateColumns="False" Width="900px"
                        CssClass="tbl" OnRowCancelingEdit="grvListBus_RowCancelingEdit" OnRowDeleting="grvListBus_RowDeleting"
                        OnRowEditing="grvListBus_RowEditing" 
                        OnRowUpdating="grvListBus_RowUpdating" DataKeyNames="ListBusId,NumberSeat"
                        OnRowDataBound="grvListBus_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="ListBusId" HeaderText="List Bus #" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle CssClass="th" />
                                <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Bus Name" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# Eval("BusName")%>
                                </ItemTemplate>
                                <HeaderStyle CssClass="th" />
                                <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Routes" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# Eval("RoutesName")%>
                                </ItemTemplate>
                                <HeaderStyle CssClass="th" />
                                <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# Eval("Price")%>$
                                </ItemTemplate>
                                <HeaderStyle CssClass="th" />
                                <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Number Seat" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# Eval("NumberSeat")%>
                                </ItemTemplate>
                                <HeaderStyle CssClass="th" />
                                <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Promote Name" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblPromote" runat="server" Text='<%# Eval("PromoteName")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblPromote" runat="server" Text='<%# Eval("PromoteName")%>' Visible="false"></asp:Label>
                                    <asp:DropDownList ID="ddlPromote" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <HeaderStyle CssClass="th" />
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
                                <HeaderStyle CssClass="th" />
                                <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete ?" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <span onclick="return confirm('Delete ?')">
                                        <asp:LinkButton ID="lbtnDel" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                                    </span>
                                </ItemTemplate>
                                <HeaderStyle CssClass="th" />
                                <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <!-- End #search-view-->
                <div id="submit">
                    <div>
                        <asp:Button ID="btnCheckout" runat="server" Text="Checkout »" CssClass="button2 fr" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update cart »" CssClass="button2 fr" /></div>
                </div>
                <!-- End #submit -->
                <div id="total-order" class="fr">
                    <h2 class="title">
                        Total</h2>
                    <p>
                        <span>Ticket Count</span><asp:Label ID="lblCount" runat="server" Text="total"></asp:Label></p>
                    <span>Order Total</span><asp:Label ID="lblTotal" runat="server" Text="total"></asp:Label>$</p>
                    <asp:Button ID="btnCheckoutFinal" runat="server" Text="Checkout »" CssClass="button2 fl" />
                </div>
                <!-- End #total-order -->
            </div>
            <!-- End #main-content -->
        </div>
        <!-- End #main-wrapper -->
        <div id="footer">
            <div id="main-footer">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Site Map</a></li>
                </ul>
                <div class="copyright">
                    <p>
                        Copyright (C) Bus Online Ticket 2013</p>
                </div>
                <!-- End .copyright -->
            </div>
            <!-- End #main-footer -->
        </div>
        <!-- End #footer -->
    </div>
    <!-- End #wrapper -->
    </form>
</body>
</html>
