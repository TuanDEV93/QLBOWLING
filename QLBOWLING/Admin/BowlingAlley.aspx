<%@ Page Title="Quản lý sân bowling" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BowlingAlley.aspx.cs" Inherits="QLBOWLING.Admin.BowlingAlley" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .property-image.status-available {
    background-color: #28a745; /* Màu xanh */
  
}

/* Trạng thái sân đang chơi */
.property-image.status-occupied {
    background-color: #dc3545; /* Màu đỏ */
   
}
.property-content .col-4 strong, 
.property-content .col-4 asp\:Literal {
    
    font-size: 20px; /* Thay đổi kích thước nếu cần */
    font-weight: bold; /* Thay đổi độ đậm nếu cần */
    color: #000; /* Điều chỉnh màu chữ (nếu cần) */
    text-align: center; /* Đảm bảo căn giữa giống Sân 2 */
    padding-top: 20px;
}
</style>
 <div class="row">
    <asp:Repeater ID="rptLane" runat="server">
        <ItemTemplate>
            <!-- Mỗi phần tử trong Repeater sẽ là một cột -->
            <div class="col-lg-4 col-sm-6 mb-3">
                <div class="property-card card status-card" data-id='<%# Eval("LaneId") %>' id="lane-<%# Eval("LaneId") %>">
                    <div class="property-image 
                                <%# Convert.ToBoolean(Eval("Status")) ? "status-available" : "status-occupied" %>">
                        <span class="property-label badge badge-warning">Trạng thái</span>
                        <h2 class="mt-3 mb-4 text-center mt-5"> </h2>
                    </div>

                    <div class="property-content card-body">
                        <div class="listingInfo">
                            <div class="row text-center">
                                <div class="col-4">
                                    <h4>0<%# Eval("LaneId") %></h4>
                                    <p class="text-overflow" title="Square Feet">Mã sân</p>
                                </div>
                                <div class="col-4">
                                    <h4><%# Eval("LaneName") %></h4>
                                    <p class="text-overflow" title="Bedrooms">Tên sân</p>
                                </div>
                                <div class="col-4">
                                    <strong>Trạng thái:</strong>
                                   <asp:Literal ID="litStatus" runat="server" 
                                                 Text='<%# Convert.ToBoolean(Eval("Status")) ? "Trống" : "Đang chơi" %>'>
                                    </asp:Literal>
                                    <br />
                                       
                                </div>
                                <asp:Button ID="btnUpdateStatus" runat="server" CssClass="btn btn-sm btn-primary mt-2"
                                 CommandArgument='<%# Eval("LaneId") %>'
                                 Text="Cập nhật trạng thái sân" OnClick="btnUpdateStatus_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

</asp:Content>
