<%@ Page Title="Quản lý lịch đặt sân" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="QLBOWLING.Admin.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets\libs\fullcalendar\fullcalendar.min.css" rel="stylesheet" type="text/css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hiddenData" runat="server" Value="1" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <div class="row">
                    <div class="col-xl-3">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Button runat="server" ID="openModal" href="#" CssClass="btn btn-lg btn-primary btn-block waves-effect waves-light" OnClientClick="openModal ()" OnClick="OpenModal" Text='Thêm lịch'></asp:Button>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12">
                        <div id="calendar">
                            <br class="Apple-interchange-newline">
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade none-border" id="modal-add">
                <div class="modal-dialog modal-lg">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title mt-0">Thông tin lịch đặt</h4>
                                    <button type="button" class="close close-modal" aria-label="Close" data-dismiss="modal">
                                        &times;
                                    </button>
                                </div>
                                <div class="modal-body p-4">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Tên khách hàng<span class="text-danger">*</span></label>
                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Nhập tên"></asp:TextBox>
                                            <asp:Label runat="server" ID="ErrMsgName" class="text-danger"></asp:Label>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Email khách hàng<span class="text-danger">*</span></label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Nhập email"></asp:TextBox>
                                            <asp:Label runat="server" ID="ErrMsgEmail" class="text-danger"></asp:Label>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">SĐT khách hàng<span class="text-danger">*</span></label>
                                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Nhập số điện thoại"></asp:TextBox>
                                            <asp:Label runat="server" ID="ErrMsgPhone" class="text-danger"></asp:Label>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Chọn sân<span class="text-danger">*</span></label>
                                            <asp:DropDownList runat="server" ID="ddLaneID" CssClass="form-control">
                                                <asp:ListItem Text="--Chọn--" Value="0" />
                                            </asp:DropDownList>
                                            <asp:Label runat="server" ID="ErrMsgLane" class="text-danger"></asp:Label>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Số người chơi<span class="text-danger">*</span></label>
                                            <asp:DropDownList ID="ddlCountPlayer" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="--Chọn--" Value="0" />
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label runat="server" ID="ErrMsgCount" class="text-danger"></asp:Label>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label class="control-label">Chọn ngày<span class="text-danger">*</span></label>
                                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                            <asp:Label runat="server" ID="ErrMsgDate" class="text-danger"></asp:Label>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Khung giờ<span class="text-danger">*</span></label>
                                            <asp:CheckBoxList ID="cblTimeSlot" runat="server" CssClass="form-group" data-parsley-multiple="groups">
                                                <asp:ListItem Text="10:00 AM - 11:00 AM" Value="10:00 AM - 11:00 AM" CssClass="checkbox" />
                                                <asp:ListItem Text="11:30 AM - 12:30 PM" Value="11:30 AM - 12:30 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="1:00 PM - 2:00 PM" Value="1:00 PM - 2:00 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="2:30 PM - 3:30 PM" Value="2:30 PM - 3:30 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="4:00 PM - 5:00 PM" Value="4:00 PM - 5:00 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="5:30 PM - 6:30 PM" Value="5:30 PM - 6:30 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="7:00 PM - 8:00 PM" Value="7:00 PM - 8:00 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="8:30 PM - 9:30 PM" Value="8:30 PM - 9:30 PM" CssClass="checkbox" />
                                            </asp:CheckBoxList>
                                            <asp:Label runat="server" ID="ErrMsgTime" class="text-danger"></asp:Label>
                                        </div>
                                    </div>
                                    <asp:Label runat="server" ID="ErrAddMsg" class="text-danger"></asp:Label>
                                    <asp:Label runat="server" ID="SuccAddMsg" class="text-success"></asp:Label>
                                </div>
                                <div class="modal-footer">
                                    <Button class="btn btn-secondary close-modal" data-dismiss="modal">Đóng</Button>
                                    <asp:Button runat="server" CssClass="btn btn-success save-schedule" Text="Thêm mới" ID="btnadd" OnClick="AddSchedule"></asp:Button>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="modal fade none-border" id="modal-schedule">
                <div class="modal-dialog modal-lg">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title mt-0">Thông tin lịch đặt</h4>
                                    <button type="button" class="close close-modal" aria-label="Close" data-dismiss="modal">
                                        &times;
                                    </button>
                                </div>
                                <div class="modal-body p-4">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Mã lịch<span class="text-danger">*</span></label>
                                            <input ID="sID" runat="server" class="form-control" ReadOnly/>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Tên khách hàng<span class="text-danger">*</span></label>
                                            <input ID="cName" runat="server" class="form-control" placeholder="Nhập tên"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Email khách hàng<span class="text-danger">*</span></label>
                                            <input ID="cEmail" runat="server" class="form-control" placeholder="Nhập email"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">SĐT khách hàng<span class="text-danger">*</span></label>
                                            <input ID="cPhone" runat="server" class="form-control" placeholder="Nhập số điện thoại"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Chọn sân<span class="text-danger">*</span></label>
                                            <asp:DropDownList runat="server" ID="ddLane" CssClass="form-control">
                                                <asp:ListItem Text="--Chọn--" Value="0" />
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Số người chơi<span class="text-danger">*</span></label>
                                            <asp:DropDownList ID="player" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="--Chọn--" Value="0" />
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label class="control-label">Chọn ngày<span class="text-danger">*</span></label>
                                            <asp:TextBox ID="date" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Khung giờ<span class="text-danger">*</span></label>
                                            <asp:CheckBoxList ID="timeSlot" runat="server" CssClass="form-group" data-parsley-multiple="groups">
                                                <asp:ListItem Text="10:00 AM - 11:00 AM" Value="10:00 AM - 11:00 AM" CssClass="checkbox" />
                                                <asp:ListItem Text="11:30 AM - 12:30 PM" Value="11:30 AM - 12:30 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="1:00 PM - 2:00 PM" Value="1:00 PM - 2:00 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="2:30 PM - 3:30 PM" Value="2:30 PM - 3:30 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="4:00 PM - 5:00 PM" Value="4:00 PM - 5:00 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="5:30 PM - 6:30 PM" Value="5:30 PM - 6:30 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="7:00 PM - 8:00 PM" Value="7:00 PM - 8:00 PM" CssClass="checkbox" />
                                                <asp:ListItem Text="8:30 PM - 9:30 PM" Value="8:30 PM - 9:30 PM" CssClass="checkbox" />
                                            </asp:CheckBoxList>
                                        </div>
                                    </div>
                                    <asp:Label runat="server" ID="ErrMsg" class="text-danger"></asp:Label>
                                    <asp:Label runat="server" ID="SuccMsg" class="text-success"></asp:Label>
                                </div>
                                <div class="modal-footer">
                                    <Button class="btn btn-secondary close-modal" data-dismiss="modal">Đóng</Button>
                                    <asp:Button runat="server" CssClass="btn btn-warning update-schedule" Text="Cập nhật" ID="btnUpdate" OnClick="UpdateSchedule"></asp:Button>
                                    <asp:Button runat="server" CssClass="btn btn-danger delete-schedule" Text="Xóa" ID="btnDelete"></asp:Button>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="assets/libs/moment/moment.min.js"></script>
    <script src="assets/libs/jquery-ui/jquery-ui.min.js"></script>
    <script src="assets/libs/fullcalendar/fullcalendar.min.js"></script>
    <script src="assets/js/pages/calendar.init.js"></script>
    <script>
        function openModal () {
            var modal = new bootstrap.Modal(document.getElementById('modal-add'), {
                backdrop: 'static'
            });
            modal.show();
        }
    </script>
</asp:Content>
