<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BowlingAlley.aspx.cs" Inherits="QLBOWLING.Admin.BowlingAlley" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row text-center">
        <div class="col-sm-12">
            <h4 class="mt-3 mb-4">Search Properties</h4>
        </div>
    </div>
    <!-- end row -->

    <div class="row">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <select class="selectpicker show-tick" data-style="btn-secondary">
                            <option value="0" disabled="">Status</option>
                            <option value="1">Rent</option>
                            <option value="2">Sale</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <select class="selectpicker show-tick" data-style="btn-secondary">
                            <option value="">Country</option>
                            <option value="1">France</option>
                            <option value="2">Great Britain</option>
                            <option value="3">Spain</option>
                            <option value="4">Russia</option>
                            <option value="5">United States</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <select class="selectpicker show-tick" data-style="btn-secondary">
                            <option value="">City</option>
                            <option value="1">New York</option>
                            <option value="2">Los Angeles</option>
                            <option value="3">Chicago</option>
                            <option value="4">Houston</option>
                            <option value="5">Philadelphia</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <select class="selectpicker show-tick" data-style="btn-secondary">
                            <option value="">Property Type</option>
                            <option value="1">Apartment</option>
                            <option value="2">Condominium</option>
                            <option value="3">Cottage</option>
                            <option value="4">Flat</option>
                            <option value="5">House</option>
                        </select>
                    </div>
                </div>

                <div class="col-12 mb-4 text-center mt-2">
                    <button type="submit" class="btn btn-purple waves-effect waves-light"><i class="mdi mdi-magnify mr-1"></i>Search</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->

    <div class="row">
        <div class="col-lg-4 col-sm-6">
            <div class="property-card card">
                <div class="property-image">
                    <span class="property-label badge badge-warning">For Rent</span>
                </div>

                <div class="property-content card-body">
                    <div class="listingInfo">
                        <div class="">
                            <h5 class="text-success font-18 mt-0">$12500/M - $19000/M</h5>
                        </div>
                        <div class="">
                            <h5 class="text-overflow"><a href="#" class="text-dark">4BHK Alexander Court,New York</a></h5>
                            <p class="text-muted text-overflow"><i class="mdi mdi-map-marker-radius mr-1"></i>245 E 20th St, New York, NY 201609</p>

                            <div class="row text-center">
                                <div class="col-4">
                                    <h4>280</h4>
                                    <p class="text-overflow" title="Square Feet">Square Feet</p>
                                </div>
                                <div class="col-4">
                                    <h4>4</h4>
                                    <p class="text-overflow" title="Bedrooms">Bedrooms</p>
                                </div>
                                <div class="col-4">
                                    <h4>2</h4>
                                    <p class="text-overflow" title="Parking Space">Parking Space</p>
                                </div>
                            </div>

                            <div class="mt-3">
                                <button type="button" class="btn btn-success btn-block waves-effect waves-light">View Detail</button>
                            </div>

                        </div>
                    </div>
                    <!-- end. Card actions -->
                </div>
                <!-- /inner row -->
            </div>
            <!-- End property item -->
        </div>
        <!-- end col -->

        <div class="col-lg-4 col-sm-6">
            <div class="property-card card">
                <div class="property-image">
                    <span class="property-label badge badge-warning">For Rent</span>
                </div>

                <div class="property-content card-body">
                    <div class="listingInfo">
                        <div class="">
                            <h5 class="text-success font-18 mt-0">$12500/M - $19000/M</h5>
                        </div>
                        <div class="">
                            <h5 class="text-overflow"><a href="#" class="text-dark">4BHK Alexander Court,New York</a></h5>
                            <p class="text-muted text-overflow"><i class="mdi mdi-map-marker-radius mr-1"></i>245 E 20th St, New York, NY 201609</p>

                            <div class="row text-center">
                                <div class="col-4">
                                    <h4>280</h4>
                                    <p class="text-overflow" title="Square Feet">Square Feet</p>
                                </div>
                                <div class="col-4">
                                    <h4>4</h4>
                                    <p class="text-overflow" title="Bedrooms">Bedrooms</p>
                                </div>
                                <div class="col-4">
                                    <h4>2</h4>
                                    <p class="text-overflow" title="Parking Space">Parking Space</p>
                                </div>
                            </div>

                            <div class="mt-3">
                                <button type="button" class="btn btn-success btn-block waves-effect waves-light">View Detail</button>
                            </div>

                        </div>
                    </div>
                    <!-- end. Card actions -->
                </div>
                <!-- /inner row -->
            </div>
            <!-- End property item -->
        </div>
        <!-- end col -->

        <div class="col-lg-4 col-sm-6">
            <div class="property-card card">
                <div class="property-image">
                    <span class="property-label badge badge-warning">For Rent</span>
                </div>

                <div class="property-content card-body">
                    <div class="listingInfo">
                        <div class="">
                            <h5 class="text-success font-18 mt-0">$12500/M - $19000/M</h5>
                        </div>
                        <div class="">
                            <h5 class="text-overflow"><a href="#" class="text-dark">4BHK Alexander Court,New York</a></h5>
                            <p class="text-muted text-overflow"><i class="mdi mdi-map-marker-radius mr-1"></i>245 E 20th St, New York, NY 201609</p>

                            <div class="row text-center">
                                <div class="col-4">
                                    <h4>280</h4>
                                    <p class="text-overflow" title="Square Feet">Square Feet</p>
                                </div>
                                <div class="col-4">
                                    <h4>4</h4>
                                    <p class="text-overflow" title="Bedrooms">Bedrooms</p>
                                </div>
                                <div class="col-4">
                                    <h4>2</h4>
                                    <p class="text-overflow" title="Parking Space">Parking Space</p>
                                </div>
                            </div>

                            <div class="mt-3">
                                <button type="button" class="btn btn-success btn-block waves-effect waves-light">View Detail</button>
                            </div>

                        </div>
                    </div>
                    <!-- end. Card actions -->
                </div>
                <!-- /inner row -->
            </div>
            <!-- End property item -->
        </div>
        <!-- end col -->

        <div class="col-lg-4 col-sm-6">
            <div class="property-card card">
                <div class="property-image">
                    <span class="property-label badge badge-warning">For Rent</span>
                </div>

                <div class="property-content card-body">
                    <div class="listingInfo">
                        <div class="">
                            <h5 class="text-success font-18 mt-0">$12500/M - $19000/M</h5>
                        </div>
                        <div class="">
                            <h5 class="text-overflow"><a href="#" class="text-dark">4BHK Alexander Court,New York</a></h5>
                            <p class="text-muted text-overflow"><i class="mdi mdi-map-marker-radius mr-1"></i>245 E 20th St, New York, NY 201609</p>

                            <div class="row text-center">
                                <div class="col-4">
                                    <h4>280</h4>
                                    <p class="text-overflow" title="Square Feet">Square Feet</p>
                                </div>
                                <div class="col-4">
                                    <h4>4</h4>
                                    <p class="text-overflow" title="Bedrooms">Bedrooms</p>
                                </div>
                                <div class="col-4">
                                    <h4>2</h4>
                                    <p class="text-overflow" title="Parking Space">Parking Space</p>
                                </div>
                            </div>

                            <div class="mt-3">
                                <button type="button" class="btn btn-success btn-block waves-effect waves-light">View Detail</button>
                            </div>

                        </div>
                    </div>
                    <!-- end. Card actions -->
                </div>
                <!-- /inner row -->
            </div>
            <!-- End property item -->
        </div>
        <!-- end col -->

        <div class="col-lg-4 col-sm-6">
            <div class="property-card card">
                <div class="property-image">
                    <span class="property-label badge badge-warning">For Rent</span>
                </div>

                <div class="property-content card-body">
                    <div class="listingInfo">
                        <div class="">
                            <h5 class="text-success font-18 mt-0">$12500/M - $19000/M</h5>
                        </div>
                        <div class="">
                            <h5 class="text-overflow"><a href="#" class="text-dark">4BHK Alexander Court,New York</a></h5>
                            <p class="text-muted text-overflow"><i class="mdi mdi-map-marker-radius mr-1"></i>245 E 20th St, New York, NY 201609</p>

                            <div class="row text-center">
                                <div class="col-4">
                                    <h4>280</h4>
                                    <p class="text-overflow" title="Square Feet">Square Feet</p>
                                </div>
                                <div class="col-4">
                                    <h4>4</h4>
                                    <p class="text-overflow" title="Bedrooms">Bedrooms</p>
                                </div>
                                <div class="col-4">
                                    <h4>2</h4>
                                    <p class="text-overflow" title="Parking Space">Parking Space</p>
                                </div>
                            </div>

                            <div class="mt-3">
                                <button type="button" class="btn btn-success btn-block waves-effect waves-light">View Detail</button>
                            </div>

                        </div>
                    </div>
                    <!-- end. Card actions -->
                </div>
                <!-- /inner row -->
            </div>
            <!-- End property item -->
        </div>
        <!-- end col -->

        <div class="col-lg-4 col-sm-6">
            <div class="property-card card">
                <div class="property-image">
                    <span class="property-label badge badge-warning">For Rent</span>
                </div>

                <div class="property-content card-body">
                    <div class="listingInfo">
                        <div class="">
                            <h5 class="text-success font-18 mt-0">$12500/M - $19000/M</h5>
                        </div>
                        <div class="">
                            <h5 class="text-overflow"><a href="#" class="text-dark">4BHK Alexander Court,New York</a></h5>
                            <p class="text-muted text-overflow"><i class="mdi mdi-map-marker-radius mr-1"></i>245 E 20th St, New York, NY 201609</p>

                            <div class="row text-center">
                                <div class="col-4">
                                    <h4>280</h4>
                                    <p class="text-overflow" title="Square Feet">Square Feet</p>
                                </div>
                                <div class="col-4">
                                    <h4>4</h4>
                                    <p class="text-overflow" title="Bedrooms">Bedrooms</p>
                                </div>
                                <div class="col-4">
                                    <h4>2</h4>
                                    <p class="text-overflow" title="Parking Space">Parking Space</p>
                                </div>
                            </div>

                            <div class="mt-3">
                                <button type="button" class="btn btn-success btn-block waves-effect waves-light">View Detail</button>
                            </div>

                        </div>
                    </div>
                    <!-- end. Card actions -->
                </div>
                <!-- /inner row -->
            </div>
            <!-- End property item -->
        </div>
        <!-- end col -->
    </div>
    <!-- end row -->

    <div>
        <ul class="pagination pagination-split justify-content-end">
            <li class="page-item disabled">
                <a href="#" class="page-link"><i class="fa fa-angle-left"></i></a>
            </li>
            <li class="page-item active">
                <a href="#" class="page-link">1</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">2</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">3</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">4</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">5</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link"><i class="fa fa-angle-right"></i></a>
            </li>
        </ul>

    </div>
</asp:Content>
