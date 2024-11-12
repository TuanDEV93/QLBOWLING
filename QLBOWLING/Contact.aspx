<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="QLBOWLING.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/contact.css" rel="stylesheet">
    <section id="contact" class="clearfix">
        <div class="container">
            <div class="row">
                <div class="contact_1 clearfix">
                    <div class="col-sm-8">
                        <div class="profile_4 clearfix">
                            <div class="col-sm-12 space_all">
                                <h3 class="mgt">Feedback Form</h3>
                            </div>
                        </div>
                        <div class="profile_5 clearfix">
                            <div class="col-sm-6 space_left">
                                <div class="profile_5l clearfix">
                                    <h6>Your Name</h6>
                                    <input class="form-control" type="text">
                                    <h6>Your Email</h6>
                                    <input class="form-control" type="text">
                                    <h6>Your Phone</h6>
                                    <input class="form-control" type="text">
                                    <h5><a class="button" href="#">Submit</a></h5>
                                </div>
                            </div>
                            <div class="col-sm-6 space_right">
                                <div class="profile_5l clearfix">
                                    <h6>Your Message</h6>
                                    <textarea class="form-control form_1"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="contact_r clearfix">
                            <h3 class="mgt">Contact Details</h3>
                            <h4>Address</h4>
                            <p>137 Park Semper Old York, OZ 81220</p>
                            <h4>We Are Open</h4>
                            <p>Open hours: 9.00-17.00 Mon-Sat</p>
                            <h4>Phone</h4>
                            <p>+123 4567 890</p>
                            <h4>Email</h4>
                            <p><a href="#">info@gmail.com</a></p>
                        </div>
                    </div>
                </div>
                <div class="contact_2 clearfix">
                    <div class="col-sm-12">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d114964.53925916665!2d-80.29949920266738!3d25.782390733064336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88d9b0a20ec8c111%3A0xff96f271ddad4f65!2sMiami%2C+FL%2C+USA!5e0!3m2!1sen!2sin!4v1530774403788" style="border: 0; height: 450px; width: 100%;" allowfullscreen=""></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
