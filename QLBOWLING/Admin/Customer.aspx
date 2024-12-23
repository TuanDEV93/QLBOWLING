<%@ Page Title="Danh sách khách hàng" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="QLBOWLING.Admin.Customer" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <div class="row">
                    <div class="col-sm-4">
                        <a href="#custom-modal" class="btn btn-success btn-rounded btn-md waves-effect waves-light mb-4" data-animation="fadein" data-plugin="custommodal" data-overlayspeed="200" data-overlaycolor="#36404a"><i class="md md-add"></i>Đăng ký khách hàng</a>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover agents-mails-checkbox m-0  table-centered table-actions-bar">
                        <thead>
                            <tr>
                                <th>Mã Khách hàng</th>
                                <th>Tên</th>
                                <th>SĐT</th>
                                <th>Email</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>
                                    <span class="avatar-sm-box bg-primary">01</span>
                                </td>
                                <td>Tên khách hàng</td>
                                <td>+12 3456 789</td>
                                <td>Vidu@email.com</td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="avatar-sm-box bg-primary">02</span>
                                </td>
                                <td>Tên khách hàng</td>
                                <td>+12 3456 789</td>
                                <td>Vidu@email.com</td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="avatar-sm-box bg-primary">03</span>
                                </td>
                                <td>Tên khách hàng</td>
                                <td>+12 3456 789</td>
                                <td>Vidu@email.com</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- end table responsive -->
            </div>
            <!-- end card-box -->

            <div>
                <ul class="pagination pagination-split justify-content-end">
                    <li class="page-item disabled">
                        <a href="#" class="page-link"><i class="fa fa-angle-left"></i></a>
                    </li>
                    <li class="page-item">
                        <a href="#" class="page-link">1</a>
                    </li>
                    <li class="page-item active">
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

        </div>
        <!-- end col -->

    </div>
</asp:Content>
