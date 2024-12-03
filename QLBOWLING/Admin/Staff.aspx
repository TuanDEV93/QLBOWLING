<%@ Page Title="Quản lý nhân viên" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="QLBOWLING.Admin.Staff" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <div class="row">
                    <div class="col-sm-4">
                        <a href="AddStaff.aspx" class="btn btn-success btn-rounded btn-md waves-effect waves-light mb-4"><i class="md md-add"></i>Thêm nhân viên</a>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover agents-mails-checkbox m-0  table-centered table-actions-bar">
                        <thead>
                            <tr>
                                <th>Mã nhân viên</th>
                                <th>Họ tên</th>
                                <th>Địa chỉ</th>
                                <th>SĐT</th>
                                <th>Giới tính</th>
                                <th>Tác vụ</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>
                                    <span class="avatar-sm-box bg-success">T</span>
                                </td>

                                <td>Tomaslau
                                </td>

                                <td>
                                    Gia Lâm, Hà Nội
                                </td>

                                <td>987-654-3210
                                </td>
                                <td>Nam
                                </td>
                                <td>
                                    <a href="#" class="table-action-btn h3"><i class="mdi mdi-pencil-box-outline text-success"></i></a>
                                    <a href="#" class="table-action-btn h3"><i class="mdi mdi-close-box-outline text-danger"></i></a>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <span class="avatar-sm-box bg-success">C</span>
                                </td>

                                <td>Chadengle
                                </td>

                                <td>
                                    Đông Anh, Hà Nội
                                </td>

                                <td>123-456-7890
                                </td>
                                <td>Nữ
                                </td>
                                <td>
                                    <a href="#" class="table-action-btn h3"><i class="mdi mdi-pencil-box-outline text-success"></i></a>
                                    <a href="#" class="table-action-btn h3"><i class="mdi mdi-close-box-outline text-danger"></i></a>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <span class="avatar-sm-box bg-success">S</span>
                                </td>

                                <td>Stillnotdavid
                                </td>

                                <td>
                                    Cầu Giấy, Hà Nội
                                </td>

                                <td>987-654-3210
                                </td>
                                <td>Nam
                                </td>
                                <td>
                                    <a href="#" class="table-action-btn h3"><i class="mdi mdi-pencil-box-outline text-success"></i></a>
                                    <a href="#" class="table-action-btn h3"><i class="mdi mdi-close-box-outline text-danger"></i></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- end table responsive -->
            </div>
            <!-- end card-box -->
        </div>
        <!-- end col -->

    </div>
</asp:Content>
