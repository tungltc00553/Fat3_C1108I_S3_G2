<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineBusTicket.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Home Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="breadcrumb">
        <a href="#">Home</a> » <a href="#">Booking</a>
    </div>
    <!-- End .breadcrumb -->
    <!-- Nivo Slider Start -->
    <section class="slider-wrapper">
                      <div id="slideshow" class="nivoSlider"> <a class="nivo-imagesLink" href="#"><img src="images/slider/slide-1.jpg" alt="slide-1" /></a> <a class="nivo-imagesLink" href="#"><img src="images/slider/slide-2.jpg" alt="slide-2" /></a> <a class="nivo-imagesLink" href="#"><img src="images/slider/slide-3.jpg" alt="slide-3" /></a> </div>
                    </section>
    <!-- Nivo Slider End-->
    <div id="news">
        <h2>
            Tour New</h2>
        <asp:Repeater ID="rptListBus" runat="server">
            <ItemTemplate>
                <div class="news-item">
                    <div class="item-image">
                        <a href="#">
                            <img src="<%# Eval("ImageUrl") %>" /></a>
                    </div>
                    <!-- End .image -->
                    <div class="item-content">
                        <div class="place">
                            <a href="#">From: <span>
                                <%# Eval("StartPlace") %></span>To: <span>
                                    <%# Eval("DestinationPlace") %></span></a>
                        </div>
                        <!-- End .place -->
                        <div class="info">
                            Start date: <span>
                                <%# Eval("Departure")%></span>Time: <span>
                                    <%# Eval("StartTime") %>
                                    H</span>
                        </div>
                        <!-- End .info -->
                    </div>
                    <!-- End .item-content -->
                    <div class="price">
                        <p> USD
                            <%# Eval("Price") %></p>
                        <a href="#"><span>View</span></a>
                    </div>
                    <!-- End .price -->
                </div>
                <!-- End .news-item -->
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!-- End #news -->
</asp:Content>
