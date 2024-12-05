<%@ Page Title="Quản lý sân bowling" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BowlingAlley.aspx.cs" Inherits="QLBOWLING.Admin.BowlingAlley" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-4 col-sm-6">
            <div class="property-card card">
                <div class="property-image">
                    <span class="property-label badge badge-warning">Trạng thái</span>
                    <h2 class="mt3 mb4 text-center mt-5">SÂN 1</h2>
                </div>

                <div class="property-content card-body">
                    <div class="listingInfo">
                        <div class="">
                            <div class="row text-center">
                                <div class="col-4">
                                    <h4>01</h4>
                                    <p class="text-overflow" title="Square Feet">Mã sân</p>
                                </div>
                                <div class="col-4">
                                    <h4>Sân 1</h4>
                                    <p class="text-overflow" title="Bedrooms">Tên sân</p>
                                </div>
                                <div class="col-4">
                                    <h4>Đang chơi</h4>
                                    <p class="text-overflow" title="Parking Space">Trạng thái</p>
                                </div>
                            </div>

                            <div class="mt-3 text-center">
                                <button type="button" class="btn btn-warning btn-middle waves-effect waves-light col-5">Sửa</button>
                                <button type="button" class="btn btn-danger btn-middle waves-effect waves-light col-5">Xóa</button>
                            </div>

                        </div>
                    </div>
                    <!-- end. Card actions -->
                </div>
                <!-- /inner row -->
            </div>
        </div>
        <div class="col-lg-4 col-sm-6">
            <div class="property-card card">
                <div class="property-image">
                    <span class="property-label badge badge-warning">Trạng thái</span>
                    <h2 class="mt3 mb4 text-center mt-5">SÂN 1</h2>
                </div>

                <div class="property-content card-body">
                    <div class="listingInfo">
                        <div class="">
                            <div class="row text-center">
                                <div class="col-4">
                                    <h4>01</h4>
                                    <p class="text-overflow" title="Square Feet">Mã sân</p>
                                </div>
                                <div class="col-4">
                                    <h4>Sân 1</h4>
                                    <p class="text-overflow" title="Bedrooms">Tên sân</p>
                                </div>
                                <div class="col-4">
                                    <h4>Đang chơi</h4>
                                    <p class="text-overflow" title="Parking Space">Trạng thái</p>
                                </div>
                            </div>

                            <div class="mt-3 text-center">
                                <button type="button" class="btn btn-warning btn-middle waves-effect waves-light col-5">Sửa</button>
                                <button type="button" class="btn btn-danger btn-middle waves-effect waves-light col-5">Xóa</button>
                            </div>

                        </div>
                    </div>
                    <!-- end. Card actions -->
                </div>
                <!-- /inner row -->
            </div>
        </div>
        <div class="col-lg-4 col-sm-6">
            <div class="property-card card">
                <div class="property-image">
                    <span class="property-label badge badge-warning">Trạng thái</span>
                    <h2 class="mt3 mb4 text-center mt-5">SÂN 1</h2>
                </div>

                <div class="property-content card-body">
                    <div class="listingInfo">
                        <div class="">
                            <div class="row text-center">
                                <div class="col-4">
                                    <h4>01</h4>
                                    <p class="text-overflow" title="Square Feet">Mã sân</p>
                                </div>
                                <div class="col-4">
                                    <h4>Sân 1</h4>
                                    <p class="text-overflow" title="Bedrooms">Tên sân</p>
                                </div>
                                <div class="col-4">
                                    <h4>Đang chơi</h4>
                                    <p class="text-overflow" title="Parking Space">Trạng thái</p>
                                </div>
                            </div>

                            <div class="mt-3 text-center">
                                <button type="button" class="btn btn-warning btn-middle waves-effect waves-light col-5">Sửa</button>
                                <button type="button" class="btn btn-danger btn-middle waves-effect waves-light col-5">Xóa</button>
                            </div>

                        </div>
                    </div>
                    <!-- end. Card actions -->
                </div>
                <!-- /inner row -->
            </div>
        </div>

    </div>
    <!-- end row -->

    <div>
        <ul class="pagination pagination-split justify-content-end">
            <li class="page-item disabled">
                <a href="#" class="page-link"><i class="fa fa-angle-left"></i></a>
            </li>
            <li class="page-item active">
                <a href="#" class="page-link">1</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">2</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">3</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">4</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">5</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link"><i class="fa fa-angle-right"></i></a>
            </li>
        </ul>

    </div>
</asp:Content>
