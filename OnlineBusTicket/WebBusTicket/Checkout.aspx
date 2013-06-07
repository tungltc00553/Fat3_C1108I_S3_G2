<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

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
                    Checkout</h2>
                <div class="content-item">
                    <ul class="checkout-form">
                        <li class="fl">
                            <h4>
                                Billing Addresses</h4>
                            <asp:TextBox ID="txtFirstName" runat="server" class="half-input fl input" type="text"
                                name="first-name" onblur="if(this.value=='')this.value='First name';" onfocus="if(this.value=='First name')this.value='';"
                                value="First name"></asp:TextBox>
                            <asp:TextBox ID="txtLastName" runat="server" class="half-input fr input" type="text"
                                name="last-name" onblur="if(this.value=='')this.value='Last name';" onfocus="if(this.value=='Last name')this.value='';"
                                value="Last name" />
                            <asp:TextBox ID="txtAddress" runat="server" class="full-input input" type="text"
                                name="address" onblur="if(this.value=='')this.value='Address';" onfocus="if(this.value=='Address')this.value='';"
                                value="Address" />
                            <asp:TextBox ID="txtEmail" runat="server" class="half-input fl input" type="text"
                                name="email-address" onblur="if(this.value=='')this.value='Email Address';" onfocus="if(this.value=='Email Address')this.value='';"
                                value="Email Address" />
                            <asp:TextBox ID="txtPhone" runat="server" class="half-input fr input" type="text"
                                name="phone" onblur="if(this.value=='')this.value='Phone number';" onfocus="if(this.value=='Phone number')this.value='';"
                                value="Phone number" />
                        </li>
                        <li class="fr">
                            <h4>
                                Shipping Addresses</h4>
                            <asp:TextBox ID="txtFirstNameShip" runat="server" class="half-input fl input" type="text"
                                name="first-name" onblur="if(this.value=='')this.value='First name';" onfocus="if(this.value=='First name')this.value='';"
                                value="First name" />
                            <asp:TextBox ID="txtLastNameShip" runat="server" class="half-input fr input" type="text"
                                name="last-name" onblur="if(this.value=='')this.value='Last name';" onfocus="if(this.value=='Last name')this.value='';"
                                value="Last name" />
                            <asp:TextBox ID="txtAddressShip" runat="server" class="full-input input" type="text"
                                name="address" onblur="if(this.value=='')this.value='Address';" onfocus="if(this.value=='Address')this.value='';"
                                value="Address" />
                            <asp:TextBox ID="txtEmailShip" runat="server" class="half-input fl input" type="text"
                                name="email-address" onblur="if(this.value=='')this.value='Email Address';" onfocus="if(this.value=='Email Address')this.value='';"
                                value="Email Address" />
                            <asp:TextBox ID="txtPhoneShip" runat="server" class="half-input fr input" type="text"
                                name="phone" onblur="if(this.value=='')this.value='Phone number';" onfocus="if(this.value=='Phone number')this.value='';"
                                value="Phone number" />
                        </li>
                    </ul>
                    <!-- .checout-form -->
                </div>
                <div class="content-item">
                    <h4>
                        Order Note</h4>
                    <p>
                        Add any additional information here such as special delivery requires etc</p>
                    <textarea name="message" id="message_text" class="text_input" cols="60" rows="9"></textarea>
                </div>
                <div class="content-item">
                    <h4 class="tag-title">
                        Payment Method</h4>
                    <p class="radio-wrapper">
                        <input type="radio" name="payment-method" value="credit-card" />
                        Credit Card</p>
                    <p class="radio-wrapper">
                        <input type="radio" name="payment-method" value="paypal" />
                        Paypal</p>
                    <p>
                        <input type="radio" name="payment-method" value="direct-bank-transfer" />
                        Direct Bank Transfer</p>
                </div>
                <div class="content-item">
                    <h4>
                        Your Order</h4>
                    <asp:GridView ID="grvListBus" runat="server" AutoGenerateColumns="False" Width="900px"
                        CssClass="tbl" OnRowCancelingEdit="grvListBus_RowCancelingEdit" OnRowDeleting="grvListBus_RowDeleting"
                        OnRowEditing="grvListBus_RowEditing" OnRowUpdating="grvListBus_RowUpdating" DataKeyNames="ListBusId,NumberSeat"
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
                            <asp:TemplateField HeaderText="Update" ItemStyle-HorizontalAlign="Center">
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
                                    <span onclick="return confirm('Bạn có chắc chắn muốn xóa không ?')">
                                        <asp:LinkButton ID="lbtnDel" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                                    </span>
                                </ItemTemplate>
                                <HeaderStyle CssClass="th" />
                                <ItemStyle HorizontalAlign="Center" CssClass="td"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div id="total-order" class="fr">
                    <h2 class="title">
                        Total</h2>
                    <p>
                        <span>Ticket Count</span><asp:Label ID="lblCount" runat="server" Text="total"></asp:Label></p>
                    <span>Order Total</span><asp:Label ID="lblTotal" runat="server" Text="total"></asp:Label>$</p>
                    <asp:Button ID="btnCheckoutFinal" runat="server" Text="Checkout »" 
                        CssClass="button2 fl" onclick="btnCheckoutFinal_Click" />
                </div>
                <!-- End #total-order -->
            </div>
            <!-- End #main-content
            -->
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
