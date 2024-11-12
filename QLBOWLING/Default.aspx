<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QLBOWLING._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section id="center" class="clearfix center_home">
        <div class="center_home_m clearfix">
            <div class="carousel slide article-slide" id="article-photo-carousel">

                <!-- Wrapper for slides -->
                <div class="carousel-inner cont-slider">

                    <div class="item active">
                        <img alt="abc" class="iw" src="img/1.jpg">
                    </div>
                    <div class="item">
                        <img alt="abc" class="iw" src="img/2.jpg">
                    </div>
                    <div class="item">
                        <img alt="abc" class="iw" src="img/3.jpg">
                    </div>
                    <div class="item">
                        <img alt="abc" class="iw" src="img/4.jpg">
                    </div>
                    <div class="item">
                        <img alt="abc" class="iw" src="img/5.jpg">
                    </div>
                    <div class="item ">
                        <img alt="abc" class="iw" src="img/6.jpg">
                    </div>
                </div>
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li class="active" data-slide-to="0" data-target="#article-photo-carousel">
                        <img alt="" src="img/1.jpg">
                    </li>
                    <li class="" data-slide-to="1" data-target="#article-photo-carousel">
                        <img alt="" src="img/2.jpg">
                    </li>
                    <li class="" data-slide-to="2" data-target="#article-photo-carousel">
                        <img alt="" src="img/3.jpg">
                    </li>
                    <li class="" data-slide-to="3" data-target="#article-photo-carousel">
                        <img alt="" src="img/4.jpg">
                    </li>
                    <li class="" data-slide-to="4" data-target="#article-photo-carousel">
                        <img alt="" src="img/5.jpg">
                    </li>
                    <li class="" data-slide-to="5" data-target="#article-photo-carousel">
                        <img alt="" src="img/6.jpg">
                    </li>
                </ol>
            </div>
            <div class="center_home_mi clearfix">
                <h1>TEAMWORK IS AT THE CORE<br>
                    OF OUR SUCCESS </h1>
                <p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit Integer Nec Odio Praesent Libero.</p>
                <h5><a class="button" href="#">READ MORE <i class="fa fa-chevron-right"></i></a></h5>
                <h5><a class="button_1" href="#">SEE MORE <i class="fa fa-chevron-right"></i></a></h5>
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
                                        <p><span class="bold"><i class="fa fa-newspaper-o"></i>LATEST NEWS :</span> September 18, 2019 - Wenger says Nasri and gives credits to his former boss for his help.</p>
                                    </div>
                                    <div class="item">
                                        <p><span class="bold"><i class="fa fa-newspaper-o"></i>LATEST NEWS :</span> December 12, 2014 - The agawa Wasted at Old Trafford</p>
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
                            <img src="img/7.jpg" class="iw" alt="abc">
                            <p>No Matter What The Weather, No Matter What The Situation We Are In, If We Have The Right Perspective In Life, Life Will Always Be Beautiful!</p>
                            <h5><a href="#">Slider Post <span class="col_1 pull-right"><i class="fa fa-chevron-right"></i></span></a></h5>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="trend_2i clearfix">
                            <img src="img/8.jpg" class="iw" alt="abc">
                            <p>No Matter What The Weather, No Matter What The Situation We Are In, If We Have The Right Perspective In Life, Life Will Always Be Beautiful!</p>
                            <h5><a href="#">PSG sponsorship deal fails The ... <span class="col_1 pull-right"><i class="fa fa-chevron-right"></i></span></a></h5>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="trend_2i clearfix">
                            <img src="img/9.jpg" class="iw" alt="abc">
                            <p>No Matter What The Weather, No Matter What The Situation We Are In, If We Have The Right Perspective In Life, Life Will Always Be Beautiful!</p>
                            <h5><a href="#">Pogba after having another defea... <span class="col_1 pull-right"><i class="fa fa-chevron-right"></i></span></a></h5>
                        </div>
                    </div>
                </div>
                <div class="trend_3 clearfix">
                    <div class="col-sm-8">
                        <div class="trend_3l clearfix">
                            <h4 class="mgt head_1">LATEST RESULT</h4>
                            <br>
                            <img src="img/6.jpg" class="iw" height="400" alt="abc">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="trend_3r clearfix">
                            <h4 class="mgt head_1">ADVERTISEMENT</h4>
                            <br>
                            <img src="img/10.jpg" class="iw" height="400" alt="abc">
                        </div>
                    </div>
                </div>
                <div class="trend_4 clearfix">
                    <div class="col-sm-4">
                        <div class="trend_4i clearfix">
                            <h4 class="mgt head_1">NEXT MATCH</h4>
                        </div>
                        <div class="trend_4i1 clearfix">
                            <div class="trend_4i1i text-center clearfix">
                                <p class="mgt big small_tag bold">1315 Days 22 Hours 9 Minutes 29 Seconds</p>
                            </div>
                            <br>
                            <div class="trend_4i1i1 text-center clearfix">
                                <div class="col-sm-4 space_left">
                                    <div class="trend_4i1i1l text-center clearfix">
                                        <h1 class="mgt"><a class="col_1" href="#">M</a></h1>
                                        <h5>SEMPER</h5>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="trend_4i1i1m text-center clearfix">
                                        <h5 class="mgt">VS</h5>
                                        <h6>NEUTRAL</h6>
                                    </div>
                                </div>
                                <div class="col-sm-4 space_right">
                                    <div class="trend_4i1i1l text-center clearfix">
                                        <h1 class="mgt"><a class="col_4" href="#">N</a></h1>
                                        <h5>PORTA</h5>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="trend_4i1i text-center clearfix">
                                <p class="mgt big small_tag bold">
                                    Cycle Racing, Hockey March 26, 2022 11:35 - 17:00
EGET NULLA VL
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="trend_4i clearfix">
                            <h4 class="mgt head_1">UPCOMING FIXTURE</h4>
                        </div>
                        <div class="trend_4im clearfix">
                            <div class="trend_4im1 mgt clearfix">
                                <div class="col-sm-2 space_left">
                                    <div class="trend_4im1l text-center clearfix">
                                        <h4 class="mgt"><a class="col_1" href="#">N</a></h4>
                                    </div>
                                </div>
                                <div class="col-sm-8 space_all">
                                    <div class="trend_4im1m text-center clearfix">
                                        <h5 class="mgt"><a href="#">Eget Club Vs Semper</a> </h5>
                                        <h6 class="small_tag col_2">16/01/2025 14:30 16:00</h6>
                                    </div>
                                </div>
                                <div class="col-sm-2 space_right">
                                    <div class="trend_4im1l text-center clearfix">
                                        <h4 class="mgt"><a class="col_4" href="#">P</a></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="trend_4im1 clearfix">
                                <div class="col-sm-2 space_left">
                                    <div class="trend_4im1l text-center clearfix">
                                        <h4 class="mgt"><a class="col_1" href="#">N</a></h4>
                                    </div>
                                </div>
                                <div class="col-sm-8 space_all">
                                    <div class="trend_4im1m text-center clearfix">
                                        <h5 class="mgt"><a href="#">Eget Club Vs Semper</a> </h5>
                                        <h6 class="small_tag col_2">16/01/2025 14:30 16:00</h6>
                                    </div>
                                </div>
                                <div class="col-sm-2 space_right">
                                    <div class="trend_4im1l text-center clearfix">
                                        <h4 class="mgt"><a class="col_4" href="#">P</a></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="trend_4im1 border_none pdb clearfix">
                                <div class="col-sm-2 space_left">
                                    <div class="trend_4im1l text-center clearfix">
                                        <h4 class="mgt"><a class="col_1" href="#">N</a></h4>
                                    </div>
                                </div>
                                <div class="col-sm-8 space_all">
                                    <div class="trend_4im1m text-center clearfix">
                                        <h5 class="mgt"><a href="#">Eget Club Vs Semper</a> </h5>
                                        <h6 class="small_tag col_2">16/01/2025 14:30 16:00</h6>
                                    </div>
                                </div>
                                <div class="col-sm-2 space_right">
                                    <div class="trend_4im1l text-center clearfix">
                                        <h4 class="mgt"><a class="col_4" href="#">P</a></h4>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="trend_4i1i text-center clearfix">
                                <h6 class="mgt"><a href="#"><i class="fa fa-calendar col_1"></i>VIEW ALL FIXTURES</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="trend_4i clearfix">
                            <h4 class="mgt head_1">STANDINGS</h4>
                        </div>
                        <div class="trend_4ir clearfix">
                            <ul class="nav_1">
                                <li class="active"><a data-toggle="tab" href="#home"><i class="fa fa-male"></i>TOP PLAYER </a></li>
                                <li class=""><a data-toggle="tab" href="#menu1"><i class="fa fa-female"></i>TOP TEAM </a></li>
                            </ul>
                            <div class="tab-content clearfix">
                                <div id="home" class="tab-pane fade  clearfix active in">
                                    <div class="click clearfix">
                                        <table>
                                            <tbody>
                                                <tr class="bg_1">
                                                    <th>#</th>
                                                    <th>TEAM</th>
                                                    <th>P</th>
                                                    <th>W</th>
                                                    <th>L</th>
                                                    <th>D</th>
                                                </tr>
                                                <tr class="bg_2">
                                                    <th>1</th>
                                                    <th>Semp Port</th>
                                                    <th>10</th>
                                                    <th>20</th>
                                                    <th>30</th>
                                                    <th>40</th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="menu1" class="tab-pane fade   clearfix">
                                    <div class="click clearfix">
                                        <table>
                                            <tbody>
                                                <tr class="bg_1">
                                                    <th>#</th>
                                                    <th>TEAM</th>
                                                    <th>P</th>
                                                    <th>W</th>
                                                    <th>L</th>
                                                    <th>D</th>
                                                </tr>
                                                <tr class="bg_2">
                                                    <th>1</th>
                                                    <th>Eget Diam</th>
                                                    <th>20</th>
                                                    <th>30</th>
                                                    <th>40</th>
                                                    <th>50</th>
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
                                        <h4 class="mgt col">TOP CLASS ACADEMY</h4>
                                        <p class="col_3">Bhrough tarantula before wherever frog far across ubiquitously and rash that more and disrespectfully grunted less.</p>
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
                                        <h4 class="mgt col">LEADIES TEAM</h4>
                                        <p class="col_3">Bhrough tarantula before wherever frog far across ubiquitously and rash that more and disrespectfully grunted less.</p>
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
                                        <h4 class="mgt col">UNDER 21 TEAM</h4>
                                        <p class="col_3">Bhrough tarantula before wherever frog far across ubiquitously and rash that more and disrespectfully grunted less.</p>
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

    <section id="team_h">
        <div class="container">
            <div class="row">
                <div class="team_h1 clearfix">
                    <div class="col-sm-12">
                        <h4 class="mgt head_1">TEAM MEMBER</h4>
                        <br>
                    </div>
                </div>
                <div class="players_1 clearfix">
                    <div class="col-sm-3">
                        <div class="players_1i text-center clearfix">
                            <img src="img/12.jpg" class="iw" alt="abc">
                            <h4 class="bold"><a class="col_1" href="#">Semp Port</a></h4>
                            <h5>GOALKEEPER</h5>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="players_1i text-center clearfix">
                            <img src="img/13.jpg" class="iw" alt="abc">
                            <h4 class="bold"><a class="col_1" href="#">Ante Dapibus</a></h4>
                            <h5>ATTACKER</h5>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="players_1i text-center clearfix">
                            <img src="img/14.jpg" class="iw" alt="abc">
                            <h4 class="bold"><a class="col_1" href="#">Nulla Quis</a></h4>
                            <h5>DEFENDER</h5>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="players_1i text-center clearfix">
                            <img src="img/15.jpg" class="iw" alt="abc">
                            <h4 class="bold"><a class="col_1" href="#">Sed Augue</a> </h4>
                            <h5>MIDFIELDER</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="feature">
        <div class="container">
            <div class="row">
                <div class="feature_1 clearfix">
                    <div class="col-sm-8">
                        <div class="feature_1l clearfix">
                            <h4 class="mgt head_1">FEATURED NEWS</h4>
                            <br>
                            <div class="feature_1li clearfix">
                                <div class="col-sm-4 space_all">
                                    <div class="feature_1lil clearfix">
                                        <a href="#">
                                            <img src="img/8.jpg" height="240" class="iw" alt="abc"></a>
                                    </div>
                                </div>
                                <div class="col-sm-8 space_all">
                                    <div class="feature_1lir clearfix">
                                        <h6 class="mgt">April 25, 2014</h6>
                                        <h4><a href="#">Game ban after spat with officials.</a></h4>
                                        <p class="font_16">
                                            Game ban after spat with officials.
Hound a shrewd swung some inside shuffled more a the gosh into ubiquitous comfortable after one and that a outside yellow snorted less through over shook b...
                                        </p>
                                        <hr>
                                        <h5><a class="col_2" href="#">Top stories</a></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="feature_1r clearfix">
                            <h4 class="mgt head_1">MEDIA WATCH</h4>
                            <br>
                            <div class="feature_1ri clearfix">
                                <div class="col-sm-10 space_left">
                                    <div class="feature_1ril clearfix">
                                        <p class="mgt"><a href="#">Game ban after spat with officials..</a></p>
                                    </div>
                                </div>
                                <div class="col-sm-2 space_right">
                                    <div class="feature_1rir text-right clearfix">
                                        <h3 class="mgt">22 <span class="col_2 small_tag">MAY</span></h3>
                                    </div>
                                </div>
                            </div>
                            <div class="feature_1ri clearfix">
                                <div class="col-sm-10 space_left">
                                    <div class="feature_1ril clearfix">
                                        <p class="mgt"><a href="#">keen to add to his side’s.</a></p>
                                    </div>
                                </div>
                                <div class="col-sm-2 space_right">
                                    <div class="feature_1rir text-right clearfix">
                                        <h3 class="mgt">21 <span class="col_2 small_tag">APR</span></h3>
                                    </div>
                                </div>
                            </div>
                            <div class="feature_1ri clearfix">
                                <div class="col-sm-10 space_left">
                                    <div class="feature_1ril clearfix">
                                        <p class="mgt"><a href="#">impressive seven in his first four games.</a></p>
                                    </div>
                                </div>
                                <div class="col-sm-2 space_right">
                                    <div class="feature_1rir text-right clearfix">
                                        <h3 class="mgt">12 <span class="col_2 small_tag">JAN</span></h3>
                                    </div>
                                </div>
                            </div>
                            <div class="feature_1ri clearfix">
                                <div class="col-sm-10 space_left">
                                    <div class="feature_1ril clearfix">
                                        <p class="mgt"><a href="#">No team relishes a trip to the Britannia Stadium.</a></p>
                                    </div>
                                </div>
                                <div class="col-sm-2 space_right">
                                    <div class="feature_1rir text-right clearfix">
                                        <h3 class="mgt">18 <span class="col_2 small_tag">FEB</span></h3>
                                    </div>
                                </div>
                            </div>
                            <div class="feature_1ri clearfix">
                                <div class="col-sm-10 space_left">
                                    <div class="feature_1ril clearfix">
                                        <p class="mgt"><a href="#">This Way Might not be the Wrong Way.</a></p>
                                    </div>
                                </div>
                                <div class="col-sm-2 space_right">
                                    <div class="feature_1rir text-right clearfix">
                                        <h3 class="mgt">27 <span class="col_2 small_tag">JUL</span></h3>
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
                            <img src="img/16.jpg" class="iw" alt="abc">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="review_home_1l clearfix">
                            <h2 class="mgt">Review Of The Season</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit nisi pulvinar, dapibus elit malesuada.</p>
                            <div class="review_home_1li clearfix">
                                <h5>STRATEGY <span class="pull-right">90%</span></h5>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 90%"></div>
                                </div>
                            </div>
                            <div class="review_home_1li clearfix">
                                <h5>DESIGN <span class="pull-right">70%</span></h5>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 70%"></div>
                                </div>
                            </div>
                            <div class="review_home_1li clearfix">
                                <h5>MARKETING <span class="pull-right">65%</span></h5>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 65%"></div>
                                </div>
                            </div>
                            <div class="review_home_1li clearfix">
                                <h5>DEVELOPMENT <span class="pull-right">95%</span></h5>
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
                                <img src="img/17.jpg" class="iw" alt="abc">
                            </div>
                            <div class="achieve_1mi1 text-center clearfix">
                                <span class="col"><i class="fa fa-star-o"></i></span>
                                <h3 class="bold col">League Cup</h3>
                                <p class="col">Duis ac feugiat purus. Sed placerat commodo rhoncus. Curabitur sed pharetra turpis.</p>
                                <h5><a class="button" href="#">SEE MORE <i class="fa fa-chevron-right"></i></a></h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="achieve_1m clearfix">
                            <div class="achieve_1mi clearfix">
                                <img src="img/18.jpg" class="iw" alt="abc">
                            </div>
                            <div class="achieve_1mi1 text-center clearfix">
                                <span class="col"><i class="fa fa-trophy"></i></span>
                                <h3 class="bold col">Championship</h3>
                                <p class="col">Duis ac feugiat purus. Sed placerat commodo rhoncus. Curabitur sed pharetra turpis.</p>
                                <h5><a class="button" href="#">SEE MORE <i class="fa fa-chevron-right"></i></a></h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="achieve_1m clearfix">
                            <div class="achieve_1mi clearfix">
                                <img src="img/19.jpg" class="iw" alt="abc">
                            </div>
                            <div class="achieve_1mi1 text-center clearfix">
                                <span class="col"><i class="fa fa-clock-o"></i></span>
                                <h3 class="bold col">Associations</h3>
                                <p class="col">Duis ac feugiat purus. Sed placerat commodo rhoncus. Curabitur sed pharetra turpis.</p>
                                <h5><a class="button" href="#">SEE MORE <i class="fa fa-chevron-right"></i></a></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="counting">
        <div class="container">
            <div class="row">
                <div class="counting_1 clearfix">
                    <div class="col-sm-3">
                        <div class="counting_1 text-center clearfix">
                            <span><i class="fa fa-gamepad"></i></span>
                            <h1>244</h1>
                            <h4>League Cup Games</h4>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="counting_1 text-center clearfix">
                            <span><i class="fa fa-fire"></i></span>
                            <h1>116</h1>
                            <h4>League Cup Games</h4>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="counting_1 text-center clearfix">
                            <span><i class="fa fa-shield"></i></span>
                            <h1>24</h1>
                            <h4>League Cup Games</h4>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="counting_1 text-center clearfix">
                            <span><i class="fa fa-globe"></i></span>
                            <h1>2001</h1>
                            <h4>League Cup Games</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
