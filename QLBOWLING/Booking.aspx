<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="QLBOWLING.Booking" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="booking-page">
        <div class="jumbotron text-center">
            <h1>Vui lòng điền thông tin đặt sân Bowling</h1>
            <p>Form đặt sân nhanh chóng và thuận tiện!</p>
        </div>
        <style>
            .time-slot-container {
                display: flex;
                flex-wrap: wrap;
                 gap: 10px;
            }

            .time-slot {
                padding: 20px 25px;
                text-align: center;
                border-radius: 5px;
                font-weight: bold;
                color: white;
                cursor: pointer;
            }

            .time-slot.available {
                background-color: green;
            }

            .time-slot.booked {
                background-color: red;
                cursor: not-allowed;
            }

        </style>
        <div class="container">
            <div class="row">
                <!-- Cột trái: Phiếu đặt sân -->
                <div class="col-md-6">         
                   <h3> <asp:Literal runat="server" ID="litTitle" Text=""></asp:Literal></h3>

                    <h3>Thêm phiếu đặt sân</h3>

                    <div class="form-group">
                        <label for="name">Họ tên:</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Nhập tên của bạn"></asp:TextBox>
                        <asp:Label ID="lblMessage4" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Nhập email của bạn"></asp:TextBox>
                        <asp:Label ID="lblMessage3" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại:</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Nhập số điện thoại của bạn"></asp:TextBox>
                        <asp:Label ID="lblMessage0" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="date">Ngày đặt:</label>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" placeholder="Nhập ngày đặt (MM/DD/YYYY) không quá ngày hiện tại 1-2 ngày"></asp:TextBox>
                        <asp:Label ID="lblMessage1" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <asp:Button ID="btnLoadTimeSlot" runat="server" Text="Tải danh sách khung giờ " OnClick="btnLoadTimeSlot_Click" />
                     <div class="form-group">
                     <label for="timeslot">Khung giờ:</label>
                     <asp:DropDownList ID="ddlTimeSlot" runat="server" CssClass="form-control">
                         <asp:ListItem Text="--Chọn--" Value="" />
                         <asp:ListItem Text="10:00 AM - 11:00 AM" Value="10:00 AM - 11:00 AM"></asp:ListItem>
                         <asp:ListItem Text="11:30 AM - 12:30 PM" Value="11:30 AM - 12:30 PM"></asp:ListItem>
                         <asp:ListItem Text="1:00 PM - 2:00 PM" Value="1:00 PM - 2:00 PM"></asp:ListItem>
                         <asp:ListItem Text="2:30 PM - 3:30 PM" Value="2:30 PM - 3:30 PM"></asp:ListItem>
                         <asp:ListItem Text="4:00 PM - 5:00 PM" Value="4:00 PM - 5:00 PM"></asp:ListItem>
                         <asp:ListItem Text="5:30 PM - 6:30 PM" Value="5:30 PM - 6:30 PM"></asp:ListItem>
                         <asp:ListItem Text="7:00 PM - 8:00 PM" Value="7:00 PM - 8:00 PM"></asp:ListItem>
                         <asp:ListItem Text="8:30 PM - 9:30 PM" Value="8:30 PM - 9:30 PM"></asp:ListItem>


                     </asp:DropDownList>
                      <asp:Label ID="lblMessage2" runat="server" CssClass="text-danger" Enabled="False"></asp:Label>
                     </div>
                    <div class="form-group">
                        <label for="countplayer">Số người chơi:</label>
                        <asp:DropDownList ID="ddlCountPlayer" runat="server" CssClass="form-control">
                            <asp:ListItem Text="--Chọn--" Value="" />
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblMessage5" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="laneid">Tên Sân:</label>
                        <asp:TextBox ID="txtLaneID" runat="server" CssClass="form-control" ></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSubmit" runat="server" Text="Đặt ngay" CssClass="btn btn-primary btn-block" OnClick ="btnSubmit_Click"/>

                        
                </div>

                <!-- Cột phải: Bảng hiển thị khung giờ -->
                <div class="col-md-6">
                    <h3>Danh sách các khung giờ</h3>
                    <asp:Repeater ID="rptTimeSlots" runat="server">
                    <ItemTemplate>
                        <div class='<%# Convert.ToBoolean(Eval("IsBooked")) ? "time-slot booked" : "time-slot available" %>'>
                        <%# Eval("TimeSlot") %>
                        </div>
                    </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>

        <div class="alert alert-info text-center">
            <strong>Hỗ trợ 24/7:</strong> Mọi chi tiết liên hệ qua email: DreamGame@gmail.com hoặc qua số điện thoại: 0373596758
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</asp:Content>
