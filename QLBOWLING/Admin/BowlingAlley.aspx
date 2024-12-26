<%@ Page Title="Quản lý sân bowling" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BowlingAlley.aspx.cs" Inherits="QLBOWLING.Admin.BowlingAlley" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function openEditModal(alleyId) {
            var alleyCard = document.getElementById("alley-" + alleyId);
            var status = alleyCard.querySelector(".alley-status").innerText;

            // Set hidden field and dropdown value
            document.getElementById("<%= HiddenAlleyId.ClientID %>").value = alleyId;
        document.getElementById("<%= DdlStatus.ClientID %>").value = status;

        // Open the modal
        $('#<%= EditStatusModal.ClientID %>').modal('show');
        }
    </script>
 <div class="row">
    <asp:Repeater ID="rptLane" runat="server">
        <ItemTemplate>
            <!-- Mỗi phần tử trong Repeater sẽ là một cột -->
            <div class="col-lg-4 col-sm-6 mb-3">
                <div class="property-card card status-card" data-id='<%# Eval("LaneId") %>' id="lane-<%# Eval("LaneId") %>">
                    <div class="property-image">
                        <span class="property-label badge badge-warning">Trạng thái</span>
                        <h2 class="mt-3 mb-4 text-center mt-5">SÂN <%# Eval("LaneId") %></h2>
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

    <!-- Modal for Editing Status -->
    <asp:Panel ID="EditStatusModal" runat="server" CssClass="modal fade" Style="display:none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Sửa trạng thái sân</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <asp:HiddenField ID="HiddenAlleyId" runat="server" />
                    <asp:Label ID="LblAlleyName" runat="server" Text=""></asp:Label>
                    <asp:DropDownList ID="DdlStatus" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Đang chơi" Value="Đang chơi"></asp:ListItem>
                        <asp:ListItem Text="Đã đặt cọc" Value="Đã đặt cọc"></asp:ListItem>
                        <asp:ListItem Text="Trống" Value="Trống"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                
            </div>
        </div>
    </asp:Panel>

</asp:Content>
