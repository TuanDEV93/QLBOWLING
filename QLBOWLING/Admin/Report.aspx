<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="QLBOWLING.Admin.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <style>
            .btn-doanhthu {
                margin-top: 20px;
            }
        </style>
    </head>
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h2 class="mb-4">Danh sách khách hàng đặt sân nhiều nhất</h2>
                <div class="row mb-4">
                    <div class="col-sm-4">
                        <asp:Button ID="btnDuyet" runat="server" Text="Duyệt" Width="89px" CssClass="btn btn-success btn-rounded" OnClick="btnDuyet_Click" />
                    </div>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="gvTop" runat="server" class="table table-striped table-bordered table-hover" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="UserBooking" HeaderText="Họ và tên" SortExpression="UserBooking" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Phone" HeaderText="Số điện thoại" SortExpression="Phone" />
                            <asp:BoundField DataField="TotalBookings" HeaderText="Tổng số lần đặt" SortExpression="TotalBookings" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-lg-12">
            <div class="card-box">
                <h2 class="mb-4">Danh sách sân được đặt nhiều nhất</h2>
                <div class="row mb-4">
                    <div class="col-sm-6">
                        <asp:Button ID="btnDuyetSan" runat="server" Text="Duyệt" Width="89px" CssClass="btn btn-success btn-rounded" OnClick="btnDuyetSan_Click" />
                    </div>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="gvKH" runat="server" class="table table-striped table-bordered table-hover" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="LaneID" HeaderText="LaneID" SortExpression="LaneID"></asp:BoundField>
                            <asp:BoundField DataField="TotalBookings" HeaderText="Tổng số lượt đặt" SortExpression="TotalBookings"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>


    <div class="row mt-4">
    <div class="col-lg-12">
        <div class="card-box">
            <h2 class="mb-4">Tổng doanh thu</h2>
            
            <div class="row mb-4 align-items-center">
                <div class="col-sm-4">
                    <asp:Label ID="lblChonThang" runat="server" Text="Chọn tháng:" CssClass="font-weight-bold" />
                    <asp:DropDownList ID="ddlThang" runat="server" CssClass="form-control">
                        <asp:ListItem Text="1" Value="1" />
                        <asp:ListItem Text="2" Value="2" />
                        <asp:ListItem Text="3" Value="3" />
                        <asp:ListItem Text="4" Value="4" />
                        <asp:ListItem Text="5" Value="5" />
                        <asp:ListItem Text="6" Value="6" />
                        <asp:ListItem Text="7" Value="7" />
                        <asp:ListItem Text="8" Value="8" />
                        <asp:ListItem Text="9" Value="9" />
                        <asp:ListItem Text="10" Value="10" />
                        <asp:ListItem Text="11" Value="11" />
                        <asp:ListItem Text="12" Value="12" />
                    </asp:DropDownList>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblChonNam" runat="server" Text="Chọn năm:" CssClass="font-weight-bold" />
                    <asp:DropDownList ID="ddlNam" runat="server" CssClass="form-control">
                        <asp:ListItem Text="2023" Value="2023" />
                        <asp:ListItem Text="2024" Value="2024" />
                        <asp:ListItem Text="2025" Value="2025" />
                    </asp:DropDownList>
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btnDoanhThu" runat="server" Text="Duyệt" Width="89px" CssClass="btn btn-success btn-rounded btn-doanhthu" OnClick="btnDoanhThu_Click" />
                </div>
            </div>
            
            <div class="table-responsive">
                <asp:GridView ID="GridViewRevenue" runat="server"
                    CssClass="table table-striped table-bordered table-hover"
                    AutoGenerateColumns="False"
                    EmptyDataText="Không có dữ liệu.">
                    <Columns>
                        
                        <asp:BoundField DataField="Year" HeaderText="Năm" />
                        <asp:BoundField DataField="Month" HeaderText="Tháng" />
                        <asp:BoundField DataField="TotalRevenue" HeaderText="Tổng doanh thu" DataFormatString="{0:N0}" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </div>

        </div>
    </div>
</div>

</asp:Content>
