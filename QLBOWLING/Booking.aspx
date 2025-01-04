<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="QLBOWLING.Booking" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="booking-page">
        <div class="jumbotron text-center">
            <h1>Vui lòng điền thông tin đặt sân Bowling</h1>
            <p>Form đặt sân nhanh chóng và thuận tiện!</p>
        </div>
        <style>
        .time-slot-container {
            display: block;  /* Đảm bảo mỗi khung giờ sẽ hiển thị trên một dòng */
            margin-top:30px;
        }

        .time-slot {
            display: block;  /* Các khung giờ phải là block element */
            width: 100%;  /* Đảm bảo mỗi khung giờ chiếm hết chiều rộng */
            margin-bottom: 30px;  /* Tạo khoảng cách giữa các khung giờ */
            text-align: center;
            border-radius: 20px;
            font-weight: bold;
            cursor: pointer;
        }

        .time-slot.available {
           color: #25e025;  
           
        }

        .time-slot.booked {
            color: #f20a1f;  
            cursor: not-allowed;
            pointer-events: none; /* Ngăn người dùng click */
            opacity: 0.6; /* Làm mờ khung giờ đã đặt */
            
        }
        .Border-timeSlot{
            
            border: 1px solid;
            padding-top: 30px;
            margin-top: 20px;
        }
        }
        </style>
        <div class="container">
            <div class="row">
                <!-- Cột trái: Phiếu đặt sân -->
                <div class="col-md-6">
                   <h3> <asp:Literal runat="server" ID="litTitle" Text=""></asp:Literal></h3>
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
                      <asp:TextBox ID="txtSelectedTimes" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Chọn khung giờ"></asp:TextBox>
                      <asp:Label ID="lblMessage2" runat="server" CssClass="text-danger" Enabled="False"></asp:Label>
                     
                     </div>
                    <asp:HiddenField ID="hfSelectedTimes" runat="server" />
                    <div class="form-group">
                        <label for="countplayer">Số người chơi:</label>
                        <asp:DropDownList ID="ddlPlayerCount" runat="server" CssClass="form-control">
                            <asp:ListItem Text="--Chọn--" Value="" />
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblMessage5" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <%--<div class="form-group">
                        <label for="laneid">Tên Sân:</label>
                        <asp:TextBox ID="txtLaneID" runat="server" CssClass="form-control" ></asp:TextBox>
                    </div>--%>
                    <div class="form-group">
                    <label for="price">Giá tiền:</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Giá tiền sẽ được tự động hiển thị"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSubmit" style="margin-bottom:30px;" runat="server" Text="Đặt ngay" CssClass="btn btn-primary btn-block" OnClientClick="return validateTimeSlot();" OnClick ="btnSubmit_Click"/>
                </div>

                <!-- Cột phải: Bảng hiển thị khung giờ -->
                <div class="col-md-6">

                    <h3>Danh sách các khung giờ</h3>
                    <div class ="Border-timeSlot">
                    <asp:Repeater ID="rptTimeSlots" runat="server">
                    <ItemTemplate>
                        <div class='<%# Convert.ToBoolean(Eval("IsBooked")) ? "time-slot booked" : "time-slot available" %>' 
                             data-timeslot="<%# Eval("TimeSlot") %>" 
                             onclick="addTimeSlot('<%# Eval("TimeSlot") %>')">
                             <%# Eval("TimeSlot") %>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                 </div>
                </div>
            </div>
        </div>

    </div>
 <script>
     // JavaScript để thêm hoặc xóa khung giờ khi người dùng chọn
     function addTimeSlot(timeSlot) {
         var txtSelectedTimes = document.getElementById('<%= txtSelectedTimes.ClientID %>');
         var hfSelectedTimes = document.getElementById('<%= hfSelectedTimes.ClientID %>');
         var currentValue = txtSelectedTimes.value;

         // Lấy danh sách khung giờ hiện có trong TextBox, loại bỏ các giá trị rỗng
         var selectedTimes = currentValue.split(', ').filter(function (item) { return item.trim() !== ''; });

         // Kiểm tra nếu khung giờ đã tồn tại trong danh sách đã chọn
         var timeSlotIndex = selectedTimes.indexOf(timeSlot);

         if (timeSlotIndex !== -1) {
             // Nếu khung giờ đã được chọn, xóa khung giờ đó
             selectedTimes.splice(timeSlotIndex, 1);
         } else {
             // Nếu khung giờ chưa được chọn, thêm khung giờ vào
             selectedTimes.push(timeSlot);
         }

         // Cập nhật giá trị của TextBox
         txtSelectedTimes.value = selectedTimes.join(', ');
         var updatedValue = selectedTimes.join(', ');
         txtSelectedTimes.value = updatedValue;
         hfSelectedTimes.value = updatedValue; // Cập nhật HiddenField
         //Cập nhật tổng tiền luôn
         updateTotalPrice();

     }

     // Gán giá trị từ textbox vào HiddenField khi xảy ra thay đổi
     function selectTimeSlot(timeSlot) {
         document.getElementById('<%= hfSelectedTimes.ClientID %>').value = timeSlot;
         document.getElementById('<%= txtSelectedTimes.ClientID %>').value = timeSlot;
         //Cập nhật tổng tiền luôn
         updateTotalPrice();
    }

    function validateTimeSlot() {
        const selectedTimes = document.getElementById('<%= txtSelectedTimes.ClientID %>').value;
         if (!selectedTimes) {
             alert('Vui lòng chọn time slot.');
             return false; // Ngăn form gửi lên server
         }
         return true;
     }
     function updateTotalPrice() {
         var selectedTimes = document.getElementById('<%= hfSelectedTimes.ClientID %>').value;
        var timeSlots = selectedTimes.split(', '); // Tách các khung giờ đã chọn
        var pricePerSlot = 300000; 

        // Tính tổng tiền
        var totalPrice = timeSlots.length * pricePerSlot;

        // Cập nhật tổng tiền vào TextBox
          document.getElementById('<%= txtPrice.ClientID %>').value = totalPrice;
      }
 </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</asp:Content>