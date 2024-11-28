<%@ Page Title="Thêm nhân viên" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddStaff.aspx.cs" Inherits="QLBOWLING.Admin.AddStaff" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="header-title mt-0">Điền vào mẫu</h4>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="p-4">
                                <div class="form-group">
                                    <label for="staffName">Họ tên nhân viên</label>
                                    <input type="text" class="form-control" id="staffName" placeholder="Nguyễn Văn A">
                                </div>
                                <div class="form-group">
                                    <label for="userName">Tên đăng nhập</label>
                                    <input type="text" class="form-control" id="userName" placeholder="nguyenvana">
                                </div>
                                <div class="form-group">
                                    <label for="passWord">Mật khẩu</label>
                                    <input type="text" class="form-control" id="passWord" placeholder="********">
                                </div>
                                <div class="form-group">
                                    <label for="staff-desc">Ghi chú</label>
                                    <textarea class="form-control" id="staff-desc" rows="5"></textarea>
                                </div>
                            </div>
                            <!-- end class p-20 -->

                        </div>
                        <!-- end col -->

                        <div class="col-lg-6">                           
                            <div class="p-4">
                                <div class="form-group mb-4">
                                    <label class="mb-2">Giới tính</label>
                                    <br>
                                    <div class="radio radio-info form-check-inline">
                                        <input type="radio" id="" value="option1" name="gender" checked="">
                                        <label for="">Nam</label>
                                    </div>
                                    <div class="radio radio-info form-check-inline">
                                        <input type="radio" id="" value="option2" name="gender">
                                        <label for="">Nữ</label>
                                    </div>
                                </div>
                                <div class="form-group mb-4">
                                    <label for="numberPhone">SĐT</label>
                                    <input type="text" class="form-control" id="numberPhone" placeholder="0123456789">
                                </div>
                                <div class="form-group mb-4">
                                    <label for="address">Địa chỉ</label>
                                    <input type="text" class="form-control" id="address" placeholder="Hà Nội">
                                </div>
                            </div>
                            <!-- end class p-20 -->
                        </div>
                        <!-- end col -->

                    </div>
                    <!-- end row -->

                    <div class="text-center">
                        <button type="submit" class="btn btn-success waves-effect waves-light">Xác nhận</button>
                        <button type="button" class="btn btn-danger waves-effect waves-light">Hủy</button>
                    </div>
                <!-- end form -->

            </div>
            <!-- end card-box -->
        </div>
        <!-- end col -->
    </div>
</asp:Content>
