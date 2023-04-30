<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="draftProject.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start Content Page -->
    <div class="container-fluid py-5" style="background-color: #59ab6e;">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1" style="color: white;"><b>Contact Us</b></h1>
            <p style="color: white;">
                Welcome to our contact page! We're always eager to hear from our customers, partners, and anyone who's interested in our products or services. 
                Whether you have a question, a suggestion, or just want to say hi, this is the place to do it.
                <br />
                <br />

                To get in touch with us, you can use the contact form below. Just fill in your name, email address, and message, 
                and we'll get back to you as soon as possible. Alternatively, you can use the email address or phone number provided on this page to reach us directly.
                
            </p>
        </div>
    </div>


    <%-- Map which is interactive and lets users play around with it. --%>

    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d75993.25869265817!2d-2.293502315095846!3d53.47222497481179!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487a4d4c5226f5db%3A0xd9be143804fe6baa!2sManchester!5e0!3m2!1sen!2suk!4v1638006647129!5m2!1sen!2suk" style="width: 100%; height: 300px; position: relative;" allowfullscreen="" loading="lazy"></iframe>



    <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form class="col-md-9 m-auto" method="post" role="form">
                <div class="row">
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputname">Name</label>
                        <input type="text" class="form-control mt-1" id="name" name="name" placeholder="Name">
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputemail">Email</label>
                        <input type="email" class="form-control mt-1" id="email" name="email" placeholder="Email">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="inputsubject">Subject</label>
                    <input type="text" class="form-control mt-1" id="subject" name="subject" placeholder="Subject">
                </div>
                <div class="mb-3">
                    <label for="inputmessage">Message</label>
                    <textarea class="form-control mt-1" id="message" name="message" placeholder="Message" rows="8"></textarea>
                </div>
                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="submit" class="btn btn-success btn-lg px-3">Let’s Talk</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- End Contact -->
</asp:Content>

