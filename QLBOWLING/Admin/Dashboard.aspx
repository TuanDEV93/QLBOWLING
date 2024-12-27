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
                        <p class="text-uppercase font-weight-medium text-truncate mb-2">Người dùng hôm nay</p>
                        <h2 class="mb-0"><span data-plugin="counterup">895</span> <i class="mdi mdi-arrow-down text-danger font-24"></i></h2>
                        <p class="text-muted mt-2 m-0"><span class="font-weight-medium">Trước:</span> 1250</p>
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
                        <p class="text-uppercase font-weight-medium text-truncate mb-2">Tổng người dùng</p>
                        <h2 class="mb-0"><span data-plugin="counterup">52410</span><i class="mdi mdi-arrow-up text-success font-24"></i></h2>
                        <p class="text-muted mt-2 m-0"><span class="font-weight-medium">Trước:</span> 40.33k</p>
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
                        <p class="text-uppercase font-weight-medium text-truncate mb-2">Yêu cầu mỗi ngày</p>
                        <h2 class="mb-0"><span data-plugin="counterup">652</span> <i class="mdi mdi-arrow-down text-danger font-24"></i></h2>
                        <p class="text-muted mt-2 m-0"><span class="font-weight-medium">Trước:</span> 956</p>
                    </div>

                </div>
            </div>
        </div>
        <!-- end col -->
    </div>
    <div class="row">
        <div class="col-xl-4">
            <div class="card-box">

                <h4 class="header-title mb-4">Doanh số</h4>

                <div class="widget-chart text-center">
                    <div id="morris-donut-example" class="morris-charts" style="height: 245px;"></div>
                    <ul class="list-inline chart-detail-list mb-0">
                        <li class="list-inline-item">
                            <h6 class="text-danger"><i class="fa fa-circle mr-2"></i>Series A</h6>
                        </li>
                        <li class="list-inline-item">
                            <h6 class="text-success"><i class="fa fa-circle mr-2"></i>Series B</h6>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- end col -->

        <div class="col-xl-4">
            <div class="card-box">

                <h4 class="header-title mb-4">Thống kê</h4>
                <div id="morris-bar-example" class="text-center morris-charts" style="height: 280px;"></div>
            </div>
        </div>
        <!-- end col -->

        <div class="col-xl-4">
            <div class="card-box">

                <h4 class="header-title mb-4">Tổng doanh thu</h4>
                <div id="morris-line-example" class="text-center morris-charts" style="height: 280px;"></div>
            </div>
        </div>
        <!-- end col -->

    </div>
    <div class="row">
        <div class="col-xl-6">
            <div class="card-box">
                <h4 class="header-title mb-4">Người dùng gần đây</h4>

                <div class="table-responsive">
                    <table class="table table-hover table-centered m-0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Tên</th>
                                <th>Số CCCD</th>
                                <th>SĐT</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>
                                    <span class="avatar-sm-box bg-success">T</span>
                                </th>
                                <td>
                                    <h5 class="m-0 font-15">Tên người dùng</h5>
                                </td>
                                <td>012345678999</td>
                                <td>+12 3456 789</td>
                                <td>Vidu@email.com</td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="avatar-sm-box bg-primary">T</span>
                                </th>
                                <td>
                                    <h5 class="m-0 font-15">Tên người dùng</h5>
                                </td>
                                <td>012345678999</td>
                                <td>+12 3456 789</td>
                                <td>Vidu@email.com</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <!-- table-responsive -->
            </div>
            <!-- end card -->
        </div>
        <!-- end col -->

        <div class="col-xl-6">
            <div class="card-box">
                <h4 class="header-title mb-4">Nhân viên của tháng</h4>

                <div class="table-responsive">
                    <table class="table table-hover table-centered m-0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>User Name</th>
                                <th>Phone</th>
                                <th>Location</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>
                                    <span class="avatar-sm-box bg-success">L</span>
                                </th>
                                <td>
                                    <h5 class="m-0 font-15">Quyết</h5>
                                    <p class="m-0 text-muted"><small>Quản lý</small></p>
                                </td>
                                <td>032 3456 789</td>
                                <td>07/08/2016</td>
                            </tr>

                            <tr>
                                <th>
                                    <span class="avatar-sm-box bg-primary">C</span>
                                </th>
                                <td>
                                    <h5 class="m-0 font-15">Đức</h5>
                                    <p class="m-0 text-muted"><small>Nhân viên</small></p>
                                </td>
                                <td>038 345 6789</td>
                                
                                <td>29/07/2016</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <!-- table-responsive -->
            </div>
            <!-- end card -->
        </div>
        <!-- end col -->

    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="../Scripts/Admin/js/pages/dashboard.init.js"></script>
</asp:Content>