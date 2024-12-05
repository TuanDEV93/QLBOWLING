<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lane.aspx.cs" Inherits="QLBOWLING.Lane" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <title>Danh sách Sân</title>
    <style>
        .btn-success {
            background-color: #28a745;
            color: white;
            margin: 20px;
            padding: 50px;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
            margin: 20px;
            padding: 50px;
        }
        .lane-container {
            display: flex;
            flex-wrap: wrap;
        }
        h1 {
            color: red;
            font-size: 50px;
            margin-bottom: 30px;
        }
        .container-lane {
            background-color:black;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            width: auto;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
    </style>
    <div class="container-lane">
        <h1>Danh sách Lane</h1>
        <div class="alert alert-info">
            <strong>Chú thích:</strong>
            <span class="badge badge-success">Màu xanh</span> còn trống,
            <span class="badge badge-danger">Màu đỏ</span> có người
        </div>
        <div class="lane-container">
            <asp:Repeater ID="rptLanes" runat="server">
                <ItemTemplate>
                    <%-- Sử dụng cú pháp Data Binding để thiết lập giá trị thuộc tính --%>
                    <asp:Button ID="btnLane" runat="server" Text='<%# Eval("LaneName") %>' CommandArgument='<%# Eval("LaneID") %>' CssClass='<%# Eval("CssClass") %>' OnClick="btnLane_Click" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
