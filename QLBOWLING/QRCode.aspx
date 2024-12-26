<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QRCode.aspx.cs" Inherits="QLBOWLING.QRCode" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QR Code</title>
    <script type="text/javascript">
        // Hàm hiển thị và ẩn thông báo
        window.onload = function () {
            setTimeout(function () {
                var notification = document.getElementById("notificationBox");
                notification.style.display = "block"; // Hiển thị thông báo
                setTimeout(function () {
                    notification.style.display = "none"; // Ẩn thông báo sau 7 giây
                }, 7000);
            }, 100); // Đợi một chút trước khi hiển thị thông báo (100ms)
        }
    </script>
    <style>
        .container {
            text-align: center;
            margin-top: 50px;
        }

        .qr-code {
            margin-top: 20px;
        }

        .info {
            margin-top: 20px;
        }

        button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            button:hover {
                background-color: #45a049;
            }
        /* CSS cho hộp thoại thông báo */
        #notificationBox {
            display: none; /* Ban đầu ẩn thông báo */
            position: fixed;
            top: 10px; /* Đặt thông báo cách đầu trang một chút */
            left: 50%;
            transform: translateX(-50%); /* Căn giữa theo chiều ngang */
            background-color: #ffcc00; /* Màu vàng cho thông báo */
            color: #000; /* Màu chữ đen */
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px; /* Bo tròn góc */
            box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.2);
            z-index: 10000; /* Đảm bảo thông báo hiển thị trên cùng */
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Thông báo thanh toán tiền cọc -->
        <div id="notificationBox">
            Vui lòng thanh toán tiền cọc để giữ sân!
           
        </div>

        <div class="container">
            <h2>Thông tin đặt sân</h2>
            <div class="info">
                <p>
                    <strong>Tên khách hàng:</strong>
                    <asp:Literal ID="litUserBooking" runat="server"></asp:Literal>
                </p>
                <p>
                    <strong>Số điện thoại:</strong>
                    <asp:Literal ID="litPhone" runat="server"></asp:Literal>
                </p>
                <p>
                    <strong>Ngày đặt:</strong>
                    <asp:Literal ID="litBookingDate" runat="server"></asp:Literal>
                </p>
                <p>
                    <strong>Khung giờ:</strong>
                    <asp:Literal ID="litTimeSlot" runat="server"></asp:Literal>
                </p>
                <p>
                    <strong>Tiền cọc sân:</strong>
                    <asp:Literal ID="LitDepositPrice" runat="server"></asp:Literal>
                </p>
                <p>
                    <strong>Nội dung chuyển:</strong>
                    <asp:Literal ID="LitGuid" runat="server"></asp:Literal>
                </p>
                <p>
                    <strong>Tên chủ tài khoản:</strong>
                    <asp:Literal ID="LitBank" runat="server"></asp:Literal>
                </p>
                <p>
                    <strong>Số tài khoản:</strong>
                    <asp:Literal ID="LitSTK" runat="server"></asp:Literal>
                </p>
            </div>

            <asp:ScriptManager ID="ScriptManager1" runat="server" />

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="qr-code">
                <div class="payment-method">
                    <div class="transfer-form">
                        <h2>Chuyển khoản qua mã QR</h2>
                        <div class="qr-code">
                            <img id="img_qr_bank" runat="server" alt="QR Code" src="./Images/bg1.jpg">
                        </div>
                        <div class="btn-coppy">
                            <p>Quét mã QR để chuyển khoản.</p>

                        </div>
                    </div>
                </div>
                <%--<img src="Images/QRCode.jpg" alt="QR Code" />--%>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
</body>
</html>
