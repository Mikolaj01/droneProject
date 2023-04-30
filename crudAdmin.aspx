<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="crudAdmin.aspx.cs" Inherits="draftProject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style9 {
            height: 25px;
            text-align: center;
            font-family: Calibri;
            font-size: small;
            width: 1365px;
        }
        .auto-style10 {
            width: 1365px;
            height: 98px;
        }
        .auto-style11 {
            width: 1511px;
            height: 28px;
        }
        .auto-style12 {
            width: 30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div class="container-fluid py-5" style="background-color: #59ab6e;">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1" style="color: white;"><b>Admin Page</b></h1>         
        </div>
    </div>
    <div class="row-prod">
    <table class="auto-style12">
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style9">
                <asp:Label ID="lblSignup" runat="server" Text="Admin Login Details" Font-Bold="True" Font-Size="Large"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
                <tr>
            <td class="auto-style11">
                <asp:Label ID="lbLID" runat="server" Text="Admin ID"></asp:Label>
                    </td>
            <td class="auto-style9">
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">
                <asp:Label ID="lblSignupUsername" runat="server" Text="Username"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtSignupUsername" runat="server"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td class="auto-style11">
                <asp:Label ID="lblSignupPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtSignupPassword" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">
                <asp:Label ID="lblFirstname" runat="server" Text="Firstname"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtFirstname" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">
                <asp:Label ID="lblLastname" runat="server" Text="Lastname"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtLastname" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style9">
                <asp:Button ID="lblRetrieve" runat="server" Text="Retrieve" OnClick="lblRetrieve_Click" />
                
                <asp:Button ID="lblUpdate" runat="server" Text="Update" OnClick="lblUpdate_Click" />
                <asp:Button ID="lblDelete" runat="server" Text="Delete" OnClick="lblDelete_Click" />
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
    </table>
        </div>

</asp:Content>
