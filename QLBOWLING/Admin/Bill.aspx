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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
