<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="draftProject.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4 order-md-2 mb-4">
                <div class="row-prod">
                    <asp:LinkButton ID="lbLogin" runat="server" OnClick="lbLogin_Click">Login</asp:LinkButton>
                    &nbsp;|
    <asp:LinkButton ID="lbSignup" runat="server" OnClick="lbSignup_Click">Signup</asp:LinkButton>
                    <br />
                    <asp:PlaceHolder ID="phLogin" Visible="true" runat="server">
                        <br />
                        <table style="width: 40%;">

                            <tr>

                                <td class="auto-style1">
                                    <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
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
                                    <br />
                                    <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                                </td>

                                <td class="auto-style5"></td>
                            </tr>
                        </table>
                    </asp:PlaceHolder>


                    <asp:PlaceHolder ID="phSignup" Visible="false" runat="server">
                        <table style="width: 80%;">
                            <tr>
                                <td class="auto-style6">&nbsp;</td>
                                <td class="auto-style2">
                                    <asp:Label ID="lblSignup" runat="server" ></asp:Label>
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
                                <td class="auto-style1">&nbsp;</td>
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
