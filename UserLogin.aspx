<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="draftProject.UserLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4 order-md-2 mb-4">
                                <asp:LinkButton ID="lbLogin" runat="server" OnClick="lbLogin_Click">Login</asp:LinkButton>
    &nbsp;|
    <asp:LinkButton ID="lbSignup" runat="server" OnClick="lbSignup_Click">Signup</asp:LinkButton>
        <asp:PlaceHolder ID="phLogin" Visible="true" runat="server">
    <table style="width: 80%;">

        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:Label ID="lblAttempts" runat="server" Text="Please enter names - 3 attempts"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style4">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </td>
            <td class="auto-style5"></td>
        </tr>
    </table>
</asp:PlaceHolder>


    <asp:PlaceHolder ID="phSignup" Visible="false" runat="server">
    <table style="width: 80%">
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style2">
                <asp:Label ID="lblSignup" runat="server" Text="Signup"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="lblSignupUsername" runat="server" Text="Username"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtSignupUsername" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="lblSignupPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtSignupPassword" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblConfirmPwd" runat="server" Text="Confirm Password"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblFirstname" runat="server" Text="Firstname"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtFirstname" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblLastname" runat="server" Text="Lastname"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtLastname" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style4">
                <asp:Button ID="btnSignup" runat="server" Text="Signup" OnClick="btnSignup_Click" />
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
    </table>
</asp:PlaceHolder>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </div>
            </div>
        </div>
</asp:Content>
