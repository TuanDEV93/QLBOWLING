<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="QLBOWLING._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section id="center" class="clearfix center_home">
        <div class="center_home_m clearfix">
            <div class="carousel slide article-slide" id="article-photo-carousel">

                <!-- Wrapper for slides -->
                <div class="carousel-inner cont-slider">

                    <div class="item active">
                        <img alt="abc" class="iw" src="Images/Bowling.jpg">
                    </div>
                    <div class="item">
                        <img alt="abc" class="iw" src="Images/Bowling2.jpg">
                    </div>
                    <div class="item">
                        <img alt="abc" class="iw" src="Images/Bowling3.jpg">
                    </div>
                    <div class="item">
                        <img alt="abc" class="iw" src="Images/Bowling4.jpg">
                    </div>
                    <div class="item">
                        <img alt="abc" class="iw" src="Images/Bowling5.jpg">
                    </div>
                    <div class="item ">
                        <img alt="abc" class="iw" src="Images/Bowling3.jpg">
                    </div>
                </div>
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li class="active" data-slide-to="0" data-target="#article-photo-carousel">
                        <img alt="" src="Images/Bowling.jpg">
                    </li>
                    <li class="" data-slide-to="1" data-target="#article-photo-carousel">
                        <img alt="" src="Images/Bowling2.jpg">
                    </li>
                    <li class="" data-slide-to="2" data-target="#article-photo-carousel">
                        <img alt="" src="Images/Bowling.jpg">
                    </li>
                    <li class="" data-slide-to="3" data-target="#article-photo-carousel">
                        <img alt="" src="Images/Bowling.jpg">
                    </li>
                    <li class="" data-slide-to="4" data-target="#article-photo-carousel">
                        <img alt="" src="Images/Bowling.jpg">
                    </li>
                    <li class="" data-slide-to="5" data-target="#article-photo-carousel">
                        <img alt="" src="Images/Bowling3.jpg">
                    </li>
                </ol>
            </div>
            <div class="center_home_mi clearfix">
                <h1>CHÀO MỪNG BẠN ĐẾN VỚI BOWLING AEON MALL LONG BIÊN </h1>
                <p>Tận hưởng những phút giây thư giãn và vui vẻ tại trung tâm Bowling hiện đại nhất Hà Nội. Đặt chỗ ngay hôm nay!</p>
                <h5><a class="button" href="Lane.aspx">Đặt sân ngay <i class="fa fa-chevron-right"></i></a></h5>
            </div>
        </div>

    </section>

    <section id="trend">
        <div class="container">
            <div class="row">
                <div class="trend_1 clearfix">
                    <div class="col-sm-10">
                        <div class="trend_1l clearfix">
                            <div id="carousel-example" class="carousel slide" data-ride="carousel">
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <p><span class="bold"><i class="fa fa-newspaper-o"></i>Tin nổi bật :</span>Thứ Ba, 12/12/2024: "Giải đấu Bowling mùa đông tại Aeon Mall Long Biên chính thức khởi tranh!"</p>
                                            <p>Tận hưởng không khí sôi động với giải đấu quy tụ các đội mạnh nhất khu vực.</p>
                                    </div>
                                
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="trend_1r text-right clearfix">
                            <div class="controls">
                                <a class="left fa fa-chevron-left btn btn-success" href="#carousel-example" data-slide="prev"></a><a class="right fa fa-chevron-right btn btn-success" href="#carousel-example" data-slide="next"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="trend_2 clearfix">
                    <div class="col-sm-4">
                        <div class="trend_2i clearfix">
                            <img src="Images/Bowling6.jpg" class="news" style="width:360px; height:280px; object-fit:cover" alt="abc">
                            <p>Top 5 mẹo giúp bạn cải thiện kỹ năng bowling!</p>
                            
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="trend_2i clearfix">
                            <img src="Images/Bowling7.jpg" class="news" style="width:360px; height:280px; object-fit:cover" alt="abc">
                            <p>Trải nghiệm dịch vụ và không gian đẳng cấp tại Bowling Zone - Aeon Mall Long Biên.</p>
                           
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="trend_2i clearfix">
                            <img src="Images/Bowling8.jpg" class="news" style="width:360px; height:280px; object-fit:cover" alt="abc">
                            <p>Sự kiện đặc biệt: Đăng ký giải đấu mùa đông ngay hôm nay để nhận ưu đãi hấp dẫn.</p>
                           
                        </div>
                    </div>
                </div>
                <div class="trend_3 clearfix">
                    <div class="col-sm-8">
                        <div class="trend_3l clearfix">
                            <h4 class="mgt head_1">LATEST RESULT</h4>
                            <br>
                            <img src="Images/Bowling9.jpg" class="result" style="width:100%; height:100%; object-fit:cover" alt="abc">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="trend_3r clearfix">
                            <h4 class="mgt head_1">ADVERTISEMENT</h4>
                            <br>
                            <img src="Images/Bowling10.jpg" class="advertisement" style="width:100%; height:100%; object-fit:cover" alt="abc">
                        </div>
                    </div>
                </div>
                <div class="trend_4 clearfix">
                    <div class="col-sm-4">
                        <div class="trend_4i clearfix">
                            <h4 class="mgt head_1">Trận đấu tiếp theo</h4>
                        </div>
                        <div class="trend_4i1 clearfix">
                            <div class="trend_4i1i text-center clearfix">
                                <p class="mgt big small_tag bold">Trận đấu tiếp theo</p>
                            </div>
                            <br>
                            <div class="trend_4i1i1 text-center clearfix">
                                <div class="col-sm-4 space_left">
                                    <div class="trend_4i1i1l text-center clearfix">
                                        <h1 class="mgt"><a class="col_1" href="#">M</a></h1>
                                        <h5>Đội Strike Force </h5>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="trend_4i1i1m text-center clearfix">
                                        <h5 class="mgt">VS</h5>
                                        <h6>Thi đấu!</h6>
                                    </div>
                                </div>
                                <div class="col-sm-4 space_right">
                                    <div class="trend_4i1i1l text-center clearfix">
                                        <h1 class="mgt"><a class="col_4" href="#">N</a></h1>
                                        <h5>Đội Pin Crushers </h5>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="trend_4i1i text-center clearfix">
                                <p class="mgt big small_tag bold">
                                    Bowling Zone, Aeon Mall Long Biên,Chủ nhật, 22/12/2024, 15:00 - 17:00
EGET NULLA VL
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="trend_4i clearfix">
                            <h4 class="mgt head_1">Lịch thi đấu sắp tới</h4>
                        </div>
                        <div class="trend_4im clearfix">
                            <div class="trend_4im1 mgt clearfix">
                               
                                <div class="col-sm-8 space_all">
                                    <div class="trend_4im1m text-center clearfix">
                                        <h5 class="mgt"><a href="#">Đội Thunder Rollers vs Pin Crushers (16:30)</a> </h5>
                                        <h6 class="small_tag col_2">23/12/2024</h6>
                                    </div>
                                </div>
                              
                           
                                <div class="col-sm-8 space_all">
                                    <div class="trend_4im1m text-center clearfix">
                                        <h5 class="mgt"><a href="#">Đội Strike Force vs Rolling Pros (14:30)</a> </h5>
                                        <h6 class="small_tag col_2">24/12/2024</h6>
                                    </div>
                                </div>
                                
                            </div>
                          
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="trend_4i clearfix">
                            <h4 class="mgt head_1">Bảng xếp hạng</h4>
                        </div>
                        <div class="trend_4ir clearfix">
                            
                            <div class="tab-content clearfix">
                                <div id="home" class="tab-pane fade  clearfix active in">
                                    <div class="click clearfix">
                                        <table>
                                            <tbody>
                                                <tr class="bg_1">
                                                    <th>#</th>
                                                    <th>Đội</th>
                                                    <th>P</th>
                                                    <th>W</th>
                                                    <th>L</th>
                                                    <th>D</th>
                                                </tr>
                                                <tr class="bg_2">
                                                    <th>1</th>
                                                    <th>Strike Force</th>
                                                    <th>10</th>
                                                    <th>8</th>
                                                    <th>2</th>
                                                    <th>0</th>
                                                </tr>
                                                <tr class="bg_3">
                                                    <th>2</th>
                                                    <th>Pin Crushers</th>
                                                    <th>10</th>
                                                    <th>6</th>
                                                    <th>4</th>
                                                    <th>0</th>
</tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                         

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <section id="visit">
        <div class="visit_m clearfix">
            <div class="container">
                <div class="row">
                    <div class="visit clearfix">
                        <div class="col-sm-5">
                            <div class="visit_l clearfix"></div>
                        </div>
                        <div class="col-sm-7">
                            <div class="visit_r mgt clearfix">
                                <div class="col-sm-10 space_left">
                                    <div class="visit_rl clearfix">
                                        <h4 class="mgt col">Trung tâm Bowling Cao Cấp</h4>
                                        <p class="col_3">Khám phá trải nghiệm bowling đẳng cấp với cơ sở vật chất hiện đại tại Aeon Mall Long Biên.</p>
                                    </div>
                                </div>
                                <div class="col-sm-2 space_right">
                                    <div class="visit_rr clearfix">
                                        <span class="col"><i class="fa fa-trophy"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="visit_r clearfix">
                                <div class="col-sm-10 space_left">
                                    <div class="visit_rl clearfix">
                                        <h4 class="mgt col">Đội Nữ</h4>
                                        <p class="col_3">Thử sức và tận hưởng không gian giải trí bowling dành riêng cho phái đẹp.</p>
                                    </div>
                                </div>
                                <div class="col-sm-2 space_right">
                                    <div class="visit_rr clearfix">
                                        <span class="col"><i class="fa fa-female"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="visit_r clearfix">
                                <div class="col-sm-10 space_left">
                                    <div class="visit_rl clearfix">
                                        <h4 class="mgt col">Độ tuổi trẻ trung</h4>
                                        <p class="col_3">Tham gia nhóm chơi bowling trẻ trung và năng động, phù hợp cho các bạn độ tuổi trẻ trung.</p>
                                    </div>
                                </div>
                                <div class="col-sm-2 space_right">
                                    <div class="visit_rr clearfix">
                                        <span class="col"><i class="fa fa-flag"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

   
    
    <section id="review_home">
        <div class="container">
            <div class="row">
                <div class="review_home_1 clearfix">
                    <div class="col-sm-6">
                        <div class="review_home_1r clearfix">
                            <img src="Images/Bowling12.jpg" class="review"  style="width:560px; height:420px; object-fit:cover" alt="abc">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="review_home_1l clearfix">
                            <h2 class="mgt">Tổng kết năm tại Bowling Zone</h2>
                            <p>Bowling Zone tại Aeon Mall Long Biên là nơi lý tưởng để bạn tận hưởng những giây phút vui vẻ bên gia đình và bạn bè. Với thiết kế hiện đại, không gian rộng rãi và các tiện nghi cao cấp, nơi đây trở thành địa điểm yêu thích của cả người chơi nghiệp dư và chuyên nghiệp.</p>
                            <div class="review_home_1li clearfix">
                                <h5>Chất lượng dịch vụ <span class="pull-right">90%</span></h5>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 90%"></div>
                                </div>
                            </div>
                            <div class="review_home_1li clearfix">
                                <h5>Thiết kế không gian: <span class="pull-right">90%</span></h5>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 70%"></div>
                                </div>
                            </div>
                            <div class="review_home_1li clearfix">
                                <h5>Chương trình khuyến mãi: <span class="pull-right">85%</span></h5>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 65%"></div>
                                </div>
                            </div>
                            <div class="review_home_1li clearfix">
                                <h5>Mức độ hài lòng khách hàng: <span class="pull-right">95%</span></h5>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 95%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="achieve">
        <div class="container">
            <div class="row">
                <div class="achieve_1 clearfix">
                    <div class="col-sm-4">
                        <div class="achieve_1m clearfix">
                            <div class="achieve_1mi clearfix">
                                <img src="Images/Bowling20.jpg" class="iw" style="width:360px; height:360px; object-fit:cover" alt="abc">
                            </div>
                            <div class="achieve_1mi1 text-center clearfix">
                                <span class="col"><i class="fa fa-star-o"></i></span>
                                <h3 class="bold col">League Cup</h3>
                                <p class="col">"League Cup Bowling" là giải đấu lớn nhất tại Aeon Mall Long Biên, quy tụ các đội xuất sắc nhất trong khu vực.</p>
                                <h5><a class="button" href="#">SEE MORE <i class="fa fa-chevron-right"></i></a></h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="achieve_1m clearfix">
                            <div class="achieve_1mi clearfix">
                                <img src="Images/Bowling16.jpg"" class="iw" style="width:360px; height:360px; object-fit:cover" alt="abc">
                            </div>
                            <div class="achieve_1mi1 text-center clearfix">
                                <span class="col"><i class="fa fa-trophy"></i></span>
                                <h3 class="bold col">Championship</h3>
                                <p class="col">"Bowling Championship" là sự kiện đỉnh cao. Với sự góp mặt của các tuyển thủ hàng đầu, giải đấu hứa hẹn sẽ mang lại những pha tranh tài đầy kịch tính.</p>
                                <h5><a class="button" href="#">SEE MORE <i class="fa fa-chevron-right"></i></a></h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="achieve_1m clearfix">
                            <div class="achieve_1mi clearfix">
                                <img src="Images/Bowling5.jpg" class="iw" style="width:360px; height:360px; object-fit:cover" alt="abc">
                            </div>
                            <div class="achieve_1mi1 text-center clearfix">
                                <span class="col"><i class="fa fa-clock-o"></i></span>
                                <h3 class="bold col">Associations</h3>
                                <p class="col">Tại Aeon Mall Long Biên, chúng tôi tự hào hợp tác với các hiệp hội và tổ chức bowling uy tín để phát triển cộng đồng người chơi.</p>
                                <h5><a class="button" href="#">SEE MORE <i class="fa fa-chevron-right"></i></a></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    

</asp:Content>
