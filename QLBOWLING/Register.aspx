<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="QLBOWLING.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        <style>
            .row-right {
                font-size: 16px;
                float: right;
            }

            .auto-style4 {
                width: 906px;
                height: 38px;
            }

            .message-box {
                position: fixed;
                top: 180px;
                right: 20px;
                padding: 15px 20px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
                font-size: 16px;
                display: flex;
                align-items: center;
                gap: 10px;
                opacity: 0;
                transform: translateX(100%);
                transition: opacity 0.3s ease, transform 0.3s ease;
                color: white;
            }

                .message-box.success {
                    background-color: #4caf50;
                }

                .message-box.error {
                    background-color: #f44336;
                }

                .message-box.show {
                    opacity: 1;
                    transform: translateX(0);
                }

                .message-box.hidden {
                    display: none;
                }

            .icon {
                font-size: 23px;
                padding-right: 10px;
            }

            .btn-register {
                border-radius: 20px;
                background-color: #99FFFF;
                border: none;
                padding: 10px 20px;
                text-align: center;
                font-size: 16px;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

                .btn-register:hover {
                    background-color: #33FFFF;
                    transform: scale(1.1);
                }

            .header-register {
                font-size: 30px;
                font-family: Arial, Helvetica, sans-serif;
            }

            .auto-style7 {
                height: 38px;
                width: 1090px;
            }

            .auto-style8 {
                width: 1090px
            }

            .auto-style9 {
                width: 906px
            }
        </style>
    </head>
    <table class="nav-justified">
        <tr>
            <td class="auto-style9" rowspan="1">&nbsp;</td>
            <td rowspan="1" class="auto-style8">
                <asp:Label ID="Label1" runat="server" CssClass="header-register" Text="ĐĂNG KÍ TÀI KHOẢN"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:Label ID="Label2" runat="server" CssClass="row-right" Text="Tên đăng nhập"></asp:Label>
            </td>
            <td class="auto-style8">
                <div style="position: relative; width: 70%;">
                    <i class="fas fa-user"
                        style="position: absolute; left: 15px; top: 50%; transform: translateY(-50%); color: gray;"></i>
                    <asp:TextBox ID="txtUsername" runat="server" Placeholder="Nhập tên đăng nhập..."
                        Style="padding-left: 45px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 25px;" Height="45px" Width="300px"></asp:TextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:Label ID="Label3" runat="server" CssClass="row-right" Text="Mật khẩu"></asp:Label>
            </td>
            <td class="auto-style8">
                <div style="position: relative; width: 70%;">
                    <i class="fas fa-lock"
                        style="position: absolute; left: 15px; top: 50%; transform: translateY(-50%); color: gray;"></i>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Nhập mật khẩu..."
                        Style="padding-left: 45px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 25px;" Height="45px" Width="300px"></asp:TextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:Label ID="Label4" runat="server" CssClass="row-right" Text="Họ và tên"></asp:Label>
            </td>
            <td class="auto-style8">
                <div style="position: relative; width: 70%;">
                    <i class="fas fa-user-circle"
                        style="position: absolute; left: 15px; top: 50%; transform: translateY(-50%); color: gray;"></i>
                    <asp:TextBox ID="txtFullname" runat="server" Placeholder="Nhập họ và tên..."
                        Style="padding-left: 45px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 25px;" Height="45px" Width="300px"></asp:TextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:Label ID="Label5" runat="server" CssClass="row-right" Text="Địa chỉ"></asp:Label>
            </td>
            <td class="auto-style8">
                <div style="position: relative; width: 70%;">
                    <i class="fas fa-map-marker-alt"
                        style="position: absolute; left: 15px; top: 50%; transform: translateY(-50%); color: gray;"></i>
                    <asp:TextBox ID="txtAddress" runat="server" Placeholder="Nhập địa chỉ..."
                        Style="padding-left: 45px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 25px;" Height="45px" Width="300px"></asp:TextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:Label ID="Label7" runat="server" CssClass="row-right" Text="Số điện thoại"></asp:Label>
            </td>
            <td class="auto-style8">
                <div style="position: relative; width: 70%;">
                    <i class="fas fa-phone"
                        style="position: absolute; left: 15px; top: 50%; transform: translateY(-50%); color: gray;"></i>
                    <asp:TextBox ID="txtPhone" runat="server" Placeholder="Nhập số điện thoại..."
                        Style="padding-left: 45px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 25px;" Height="45px" Width="300px"></asp:TextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:Label ID="Label8" runat="server" CssClass="row-right" Text="Email"></asp:Label>
            </td>
            <td class="auto-style8">
                <div style="position: relative; width: 70%;">
                    <i class="fas fa-envelope"
                        style="position: absolute; left: 15px; top: 50%; transform: translateY(-50%); color: gray;"></i>
                    <asp:TextBox ID="txtEmail" runat="server" Placeholder="Nhập email..."
                        Style="padding-left: 45px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 25px;" Height="45px" Width="300px"></asp:TextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style7">
                <asp:Button ID="btnRegister" runat="server" CssClass="btn-register" Text="Đăng Kí" OnClick="btnRegister_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style8">
                <asp:Label ID="lblNotification" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style9"></td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
    </table>

    <div id="notificationMessage" class="message-box hidden">
        <span class="icon"></span>
        <span class="message"></span>
    </div>

    <script>
        function showNotificationMessage(message, type) {
            const messageBox = document.getElementById('notificationMessage');
            const icon = messageBox.querySelector('.icon');
            const messageText = messageBox.querySelector('.message');

            messageText.textContent = message;

            if (type === 'success') {
                icon.innerHTML = '<i class="fas fa-check-circle"></i>';
            } else if (type === 'error') {
                icon.innerHTML = '<i class="fas fa-times-circle"></i>';
            }

            messageBox.className = `message-box ${type} show`;

            setTimeout(() => {
                messageBox.classList.remove('show');
                setTimeout(() => {
                    messageBox.classList.add('hidden');
                }, 300);
            }, 3000);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
