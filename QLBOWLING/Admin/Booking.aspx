<%@ Page Title="Quản lý lịch đặt sân" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="QLBOWLING.Admin.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets\libs\fullcalendar\fullcalendar.min.css" rel="stylesheet" type="text/css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
                            <asp:HiddenField ID="hiddenData" runat="server" Value="1" />
    <div class="row">
        <div class="col-lg-12">

            <div class="card-box">
                <div class="row">
                    <div class="col-xl-3">
                        <div class="row">
                            <div class="col-md-12">
                                <a href="#" data-toggle="modal" data-target="#modal-schedule" class="btn btn-lg btn-primary btn-block waves-effect waves-light">
                                    <i class="fa fa-plus"></i> Thêm lịch
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- end col-->
                    <div class="col-xl-12">
                        <div id="calendar">
                            <br class="Apple-interchange-newline">
                        </div>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>

            <!-- BEGIN MODAL -->
            <div class="modal fade none-border" id="modal-schedule">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title mt-0">Thông tin lịch đặt</h4>
                            <button type="button" class="close close-schedule" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body p-4">
                            <div class="row">
                                <div class="col-md-6" id="scheduleID" style="display:none">
                                    <label class="control-label">Mã lịch</label>
                                    <asp:TextBox ID="txtBookingID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Tên khách hàng</label>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Nhập tên"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Email khách hàng</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Nhập email"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">SĐT khách hàng</label>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Nhập số điện thoại"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Chọn sân</label>
                                    <asp:DropDownList runat="server" ID="ddLaneID" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Số người chơi</label>
                                    <asp:DropDownList ID="ddlCountPlayer" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="--Chọn--" Value="0" />
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label class="control-label">Chọn ngày</label>
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Khung giờ</label>
                                    <asp:CheckBoxList ID="cblTimeSlot" runat="server" CssClass="form-group">
                                        <asp:ListItem Text="10:00 AM - 11:00 AM" Value="1" CssClass="checkbox"/>
                                        <asp:ListItem Text="11:30 AM - 12:30 PM" Value="2" CssClass="checkbox"/>
                                        <asp:ListItem Text="1:00 PM - 2:00 PM" Value="3" CssClass="checkbox"/>
                                        <asp:ListItem Text="2:30 PM - 3:30 PM" Value="4" CssClass="checkbox"/>
                                        <asp:ListItem Text="4:00 PM - 5:00 PM" Value="5" CssClass="checkbox"/>
                                        <asp:ListItem Text="5:30 PM - 6:30 PM" Value="6" CssClass="checkbox"/>
                                        <asp:ListItem Text="7:00 PM - 8:00 PM" Value="7" CssClass="checkbox"/>
                                        <asp:ListItem Text="8:30 PM - 9:30 PM" Value="8" CssClass="checkbox"/>
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:button runat="server" class="btn btn-secondary close-schedule waves-effect" data-dismiss="modal" Text="Đóng"></asp:button>
                            <asp:Button runat="server" class="btn btn-success save-schedule waves-effect waves-light" Text="Thêm mới" ID="btnAdd"></asp:Button>
                            <asp:button runat="server" class="btn btn-warning update-schedule waves-effect waves-light" data-dismiss="modal" style="display:none" Text="Cập nhật" ID="btnUpdate"></asp:button>
                            <asp:button runat="server" class="btn btn-danger delete-schedule waves-effect waves-light" data-dismiss="modal" style="display:none" Text="Xóa" ID="btnDelete"></asp:button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade none-border" id="add-schedule">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title mt-0"></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body p-4">
                            
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-success waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MODAL -->
        </div>
        <!-- end col-12 -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="assets/libs/moment/moment.min.js"></script>
    <script src="assets/libs/jquery-ui/jquery-ui.min.js"></script>
    <script src="assets/libs/fullcalendar/fullcalendar.min.js"></script>
    <script src="assets/js/pages/calendar.init.js"></script>
</asp:Content>