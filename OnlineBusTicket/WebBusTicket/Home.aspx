<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="Server">
    <div id="slider">
        <!-- End .breadcrumb -->
        <!-- Nivo Slider Start -->
        <section class="slider-wrapper">
                      <div id="slideshow" class="nivoSlider"> <a class="nivo-imagesLink" href="#"><img src="images/slider/slide-1.jpg" alt="slide-1" /></a> <a class="nivo-imagesLink" href="#"><img src="images/slider/slide-2.jpg" alt="slide-2" /></a> <a class="nivo-imagesLink" href="#"><img src="images/slider/slide-3.jpg" alt="slide-3" /></a> </div>
                    </section>
        <!-- Nivo Slider End-->
    </div>
    <!-- End #slider -->
    <div id="news">
        <h2 >
            Book News</h2>
        <asp:Repeater ID="rptListBus" runat="server">
            <ItemTemplate>
                <div class="news-item">
                    <div class="item-image">
                        <a href="#">
                            <img src="<%# Eval("TypeImage") %>" /></a>
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
                        <p>
                            USD
                            <%# Eval("Price") %></p>
                        <a href='BusDetail.aspx?ListBusId=<%# Eval("ListBusId") %>'><span>View</span></a>
                    </div>
                    <!-- End .price -->
                </div>
                <!-- End .news-item -->
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!-- End #news -->
</asp:Content>
