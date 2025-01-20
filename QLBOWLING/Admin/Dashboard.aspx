<%@ Page Title="Bảng điều khiển" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="QLBOWLING.Admin.Dashboard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-6 col-xl-3">
            <div class="card widget-box-three">
                <div class="card-body">
                    <div class="float-right mt-2">
                        <i class="mdi mdi-chart-areaspline display-3 m-0"></i>
                    </div>
                    <div class="overflow-hidden">
                        <p class="text-uppercase font-weight-medium text-truncate mb-2">Truy cập</p>
                        <h2 class="mb-0"><span data-plugin="counterup">348</span> <i class="mdi mdi-arrow-up text-success font-24"></i></h2>
                        <p class="text-muted mt-2 m-0"><span class="font-weight-medium">Trước:</span> 1.4k</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- end col -->

        <div class="col-lg-6 col-xl-3">
            <div class="card widget-box-three">
                <div class="card-body">
                    <div class="float-right mt-2">
                        <i class="mdi mdi-account-convert display-3 m-0"></i>
                    </div>
                    <div class="overflow-hidden">
                        <p class="text-uppercase font-weight-medium text-truncate mb-2">Tổng người dùng</p>
                        <h2 class="mb-0"><span data-plugin="counterup">
                            <asp:Label ID="userTotal" Text="" runat="server" /></span></h2>
                    </div>

                </div>
            </div>
        </div>
        <!-- end col -->

        <div class="col-lg-6 col-xl-3">
            <div class="card widget-box-three">
                <div class="card-body">
                    <div class="float-right mt-2">
                        <i class="mdi mdi-layers display-3 m-0"></i>
                    </div>
                    <div class="overflow-hidden">
                        <p class="text-uppercase font-weight-medium text-truncate mb-2">Doanh số</p>
                        <h2 class="mb-0"><span data-plugin="counterup"><asp:Label ID="sales" Text="" runat="server" /></span></h2>
                        <p class="text-muted mt-2 m-0"><span class="font-weight-medium">Tháng trước:</span><asp:Label ID="salesMonth" Text="" runat="server" /></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- end col -->

        <div class="col-lg-6 col-xl-3">
            <div class="card widget-box-three">
                <div class="card-body">
                    <div class="float-right mt-2">
                        <i class="mdi mdi-av-timer display-3 m-0"></i>
                    </div>
                    <div class="overflow-hidden">
                        <p class="text-uppercase font-weight-medium text-truncate mb-2">Yêu cầu hôm nay</p>
                        <h2 class="mb-0"><span data-plugin="counterup"><asp:Label ID="bookingToday" Text="" runat="server" /></span> <i class="mdi mdi-arrow-up text-success font-24"></i></h2>
                        <p class="text-muted mt-2 m-0"><span class="font-weight-medium">Tổng:</span><asp:Label ID="bookingTotal" Text="" runat="server" /></p>
                    </div>

                </div>
            </div>
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="../Scripts/Admin/js/pages/dashboard.init.js"></script>
</asp:Content>