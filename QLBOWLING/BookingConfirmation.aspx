<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingConfirmation.aspx.cs" Inherits="QLBOWLING.BookingConfirmation" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" EmptyDataText="Không có lịch sử đặt sân.">
    <Columns>
        <asp:BoundField DataField="UserBooking" HeaderText="Tên khách hàng" />
        <asp:BoundField DataField="BookingDate" HeaderText="Ngày đặt" DataFormatString="{0:MM/dd/yyyy}" />
        <asp:BoundField DataField="TimeSlot" HeaderText="Khung giờ đặt" />
        <asp:BoundField DataField="PlayerCount" HeaderText="Số người chơi" />
        <asp:BoundField DataField="LaneName" HeaderText="Tên sân" />
        <asp:BoundField DataField="TotalPrice" HeaderText="Tổng tiền thanh toán" />
        <asp:BoundField DataField="DepositPrice" HeaderText="Tiền cọc" />
        <asp:BoundField DataField="Status" HeaderText="Trạng thái" />
    </Columns>
</asp:GridView>
</asp:Content>