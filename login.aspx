<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="draftProject.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="logcontainer">
        <%-- Login form for users to login into their admin account, if correct they get taken to the admin page. --%>
        <asp:Label ID="lblUname" runat="server" Text="Username"></asp:Label>
        <asp:RequiredFieldValidator ID="rfvLogin" runat="server" ErrorMessage="Username is required" ForeColor="Red" ControlToValidate="txtUname">*</asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="txtUname" placeholder="Enter Username" runat="server" CssClass="inputbox"></asp:TextBox>
        <br />
        <asp:Label ID="lblPass" runat="server" Text="Password"></asp:Label>
       <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate= "txtPass" ErrorMessage="Password is required" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="txtPass" placeholder="Enter Username" TextMode="Password" runat="server" CssClass="inputbox"></asp:TextBox>
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button" OnClick="btnLogin_Click"  />
        <asp:ValidationSummary ID="vsLogin" runat="server" />
    </div>
</asp:Content>
