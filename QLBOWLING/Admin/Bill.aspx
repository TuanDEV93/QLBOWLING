<%@ Page Title="Quản lý hóa đơn" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="QLBOWLING.Admin.Bill" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                

                  <div class="table-responsive">
                   <asp:GridView ID="gvBill" runat="server" CssClass="table table-hover agents-mails-checkbox m-0 table-centered table-actions-bar"
                        AutoGenerateColumns="False" OnRowDataBound="gvBill_RowDataBound" DataKeyNames="BookingID">
                        <Columns>
                            <asp:BoundField DataField="UserBooking" HeaderText="Người đặt" />
                            <asp:BoundField DataField="CheckIn" HeaderText="Ngày Check-In" SortExpression="CheckIn" />
                            <asp:BoundField DataField="CheckOut" HeaderText="Ngày Check-Out" SortExpression="CheckOut" />
                            <asp:BoundField DataField="Status" HeaderText="Trạng thái" />
                            <asp:BoundField DataField="DepositPrice" HeaderText="Tiền đặt cọc" SortExpression="DepositPrice" />
                            <asp:BoundField DataField="TotalPrice" HeaderText="Tổng tiền" SortExpression="TotalPrice" />
                            <asp:BoundField DataField="LaneID" HeaderText="Mã sân" />

                            <asp:TemplateField HeaderText="Cập nhật trạng thái">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" 
                                        OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                        <asp:ListItem Text="--Chọn--" Value="" />
                                        <asp:ListItem Text="Chờ thanh toán" Value="2" />
                                        <asp:ListItem Text="Đã đặt cọc" Value="1" />
                                        <asp:ListItem Text="Đã thanh toán" Value="0" />
                                        <asp:ListItem Text="Đang chơi" Value="4" />
                                        <asp:ListItem Text="Bị hủy" Value="3" />
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                      <asp:Button ID="btnToday" runat="server" Text="Lọc hôm nay" CssClass="btn-today" OnClick="btnToday_Click" />
                      <style>
                            .btn-today {
                                font-weight: bold; /* In đậm */
                                border: 2px solid blue; /* Viền xanh */
                                padding: 5px 10px; /* Khoảng cách trong nút */
                                border-radius: 4px; /* Bo tròn góc viền */
                                background-color: white; /* Màu nền */
                                color: black; /* Màu chữ */
                                cursor: pointer; /* Con trỏ chuột thay đổi khi hover */
                            }

                            .btn-today:hover {
                                background-color: lightblue; /* Màu nền khi hover */
                            }
                      </style>
                </div>
                <div id="filterMonthYear" runat="server" style="margin-top: 20px;">
                    <fieldset style="border: 1px solid #ccc; padding: 10px; border-radius: 5px;">
                        <legend style="font-weight: bold;">Lọc theo tháng, năm</legend>
                        <label for="ddlMonth">Chọn tháng:</label>
                    <asp:DropDownList ID="ddlMonth" runat="server">
                        <asp:ListItem Value="1" Text="1" />
                        <asp:ListItem Value="2" Text="2" />
                        <asp:ListItem Value="3" Text="3" />
                        <asp:ListItem Value="4" Text="4" />
                        <asp:ListItem Value="5" Text="5" />
                        <asp:ListItem Value="6" Text="6" />
                        <asp:ListItem Value="7" Text="7" />
                        <asp:ListItem Value="8" Text="8" />
                        <asp:ListItem Value="9" Text="9" />
                        <asp:ListItem Value="10" Text="10" />
                        <asp:ListItem Value="11" Text="11" />
                        <asp:ListItem Value="12" Text="12" />
                    </asp:DropDownList>

                    <label for="ddlYear">Chọn năm:</label>
                    <asp:DropDownList ID="ddlYear" runat="server">
                        <asp:ListItem Value="2020" Text="2020" />
                        <asp:ListItem Value="2021" Text="2021" />
                        <asp:ListItem Value="2022" Text="2022" />
                        <asp:ListItem Value="2023" Text="2023" />
                        <asp:ListItem Value="2024" Text="2024" />
                        <asp:ListItem Value="2025" Text="2025" />
                        <asp:ListItem Value="2026" Text="2026" />
                    </asp:DropDownList>

                    <asp:Button ID="btnFilter" runat="server" Text="Duyệt" OnClick="btnFilter_Click" CssClass="btn btn-success" />
                    <asp:Button ID="btnReset" runat="server" Text="OK" OnClick="btnReset_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
