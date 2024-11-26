<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QLBOWLING.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        <style>
            .btnLogin {
                border-radius: 20px;
                background-color: #99FFFF;
                border: none;
                padding: 10px 20px;
                text-align: center;
                font-size: 16px;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            .btnLogin:hover {
                background-color: #33FFFF;
                transform: scale(1.1);
            }

            .auto-style2 {
                width: 1124px;
            }

            .auto-style3 {
                height: 38px;
                width: 1124px;
            }

            .auto-style4 {
                position: relative;
                width: 300px;
                left: 614px;
                top: -1px;
            }

            .auto-style5 {
                position: relative;
                width: 300px;
                left: 613px;
                top: 1px;
            }

            .lblDangnhap {
                font-size:30px;
                font-family:Arial, Helvetica, sans-serif;
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
                padding-right:10px;
            }

            .btnRegister {
                padding-left: 5px;
            }
        </style>
    </head>
    <table class="nav-justified">
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Text="ĐĂNG NHẬP" CssClass="lblDangnhap"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" rowspan="1">
                <div class="auto-style4">
                    <i class="fas fa-user" style="position: absolute; left: 15px; top: 50%; transform: translateY(-50%); color: gray;"></i>
                </div>
            </td>
            <td class="auto-style2" rowspan="1">
                <asp:TextBox ID="txtUsername" runat="server" Placeholder="Enter your username" 
                             Style="padding-left: 55px; width: 70%; height: 45px; box-sizing: border-box; border:1px solid #ccc; border-radius:25px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" rowspan="1">
                <div class="auto-style5">
                    <i class="fa-solid fa-lock" style="position: absolute; left: 15px; top: 50%; transform: translateY(-50%); color: gray;"></i>
                </div>
            </td>
            <td class="auto-style3" rowspan="1">
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Placeholder="Enter your password" 
                             Style="padding-left: 55px; width: 70%; height: 45px; box-sizing: border-box; border:1px solid #ccc; border-radius:25px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="1" style="text-align: right;" rowspan="1">&nbsp;</td>
            <td class="auto-style2" style="text-align: left;" rowspan="1">
                <asp:Button ID="btnLogin" runat="server" CssClass="btnLogin" Height="40px" Text="Đăng Nhập" Width="113px" OnClick="btnLogin_Click" />
            </td>
            <td style="width: 1237px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="1" style="text-align: right;" rowspan="1">&nbsp;</td>
            <td class="auto-style2" style="text-align: left;" rowspan="1">
                <asp:Label ID="Label2" runat="server" Text="Bạn chưa có tài khoản ?"></asp:Label>
                <asp:LinkButton ID="btnRegister" runat="server" CssClass="btnRegister" PostBackUrl="~/Register.aspx">Đăng Kí</asp:LinkButton>
            </td>
            <td style="width: 1237px">&nbsp;</td>
        </tr>
    </table>

    <div id="successMessage" class="message-box hidden">
            <span class="icon"></span>
            <span class="message"></span>
    </div>

    <script>
        function showSuccessMessage(message, type) {
            const messageBox = document.getElementById('successMessage');
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
