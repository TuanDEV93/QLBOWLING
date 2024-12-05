<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingConfirmation.aspx.cs" Inherits="QLBOWLING.BookingConfirmation" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" EmptyDataText="Không có lịch sử đặt sân.">
    <Columns>
        <asp:BoundField DataField="CustomerName" HeaderText="Tên khách hàng" />
        <asp:BoundField DataField="Date" HeaderText="Ngày đặt" DataFormatString="{0:MM/DD/yyyy}" />
        <asp:BoundField DataField="TimeSlot" HeaderText="Khung giờ đặt" />
        <asp:BoundField DataField="CountPlayer" HeaderText="Số người chơi" />
        <asp:BoundField DataField="LaneId" HeaderText="Tên sân" />
    </Columns>
</asp:GridView>
</asp:Content>