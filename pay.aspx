<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="pay.aspx.cs" Inherits="draftProject.pay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 29px;
        }
        .auto-style2 {
            width: 732px;
        }
        .auto-style3 {
            height: 29px;
            width: 732px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4 order-md-2 mb-4">
                <asp:MultiView ID="mvMain" runat="server">
                    <asp:View ID="vSummary" runat="server">
                        <asp:GridView ID="gvSummary" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvSummary_RowCommand1">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                                <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                <asp:ButtonField CommandName="UpdateItem" HeaderText="Update" Text="Update" />
                                <asp:ButtonField CommandName="RemoveItem" HeaderText="Remove" Text="Remove" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <table style="width: 100%;">
                            <tr>
                                <td>Items
            <asp:Label ID="lblItemCount" runat="server" Text="0" Font-Bold="True" Font-Size="Large"></asp:Label>
                                    , Amount
            <asp:Label ID="lblSummaryAmount" runat="server" Text="0.0" Font-Bold="True" Font-Size="Large"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                                <td class="auto-style14">
                                    <asp:Button ID="btnPayNow" runat="server" Text="Pay Now" Width="144px" OnClick="btnPayNow_Click1" /></td>
                            </tr>

                        </table>
                    </asp:View>
                    <asp:View ID="vUpdate" runat="server">
                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style26">
                                    <asp:Label ID="lblProductID" runat="server" Text="Product ID"></asp:Label>
                                </td>
                                <td class="auto-style32">
                                    <asp:Label ID="rlblProductID" runat="server" ForeColor="#999999"></asp:Label>
                                </td>
                                <td class="auto-style28">
                                    <asp:HiddenField ID="hfRowIndex" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style30">
                                    <asp:Label ID="lblProductName" runat="server" Text="Product name"></asp:Label>
                                </td>
                                <td class="auto-style33">
                                    <asp:Label ID="rlblProductName" runat="server" ForeColor="#999999"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style13">
                                    <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price"></asp:Label>
                                </td>
                                <td class="auto-style13">
                                    <asp:Label ID="rlblUnitPrice" runat="server" ForeColor="#999999"></asp:Label>
                                </td>
                                <td class="auto-style13"></td>
                            </tr>
                            <tr>
                                <td class="auto-style26">
                                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity"></asp:Label>
                                </td>
                                <td class="auto-style32">
                                    <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Width="87px"></asp:TextBox>
                                </td>
                                <td class="auto-style28"></td>
                            </tr>
                            <tr>
                                <td class="auto-style30">&nbsp;</td>
                                <td class="auto-style33">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style30">&nbsp;</td>
                                <td class="auto-style33">
                                    <asp:Button ID="btnCalculate" runat="server" Text="Recalculate" OnClick="btnCalculate_Click1"  />
                                    &nbsp;
            <asp:Button ID="btnUpdateBasket" runat="server" Text="Update Basket" OnClick="btnUpdateBasket_Click1" />
                                </td>
                                <td>
                                    <asp:Label ID="lblAmount" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="vCardDetails" runat="server">

                        <table style="width: 100%;">
                            <tr>
                                <td colspan="3"><strong>Credit/Debit Card Information<br />
                                </strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style14">Card Type</td>
                                <td class="auto-style2">
                                    <asp:DropDownList ID="ddlCardType" runat="server" ValidationGroup="CreditCard">
                                        <asp:ListItem>American Express</asp:ListItem>
                                        <asp:ListItem>Discover</asp:ListItem>
                                        <asp:ListItem>Master Card</asp:ListItem>
                                        <asp:ListItem>Visa</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvCardType" runat="server" ControlToValidate="ddlCardType" ErrorMessage="Card type is required" ForeColor="Red" ValidationGroup="CreditCard">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Card Number</td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="20" Width="219px" ValidationGroup="CreditCard"></asp:TextBox>
                                </td>
                                <td class="auto-style1">
                                    <asp:CustomValidator ID="cvCardNumber" runat="server" ErrorMessage="Card number is not valid" ForeColor="Red" ControlToValidate="txtCardNumber" OnServerValidate="cvCardNumber_ServerValidate" ValidationGroup="CreditCard">*</asp:CustomValidator>
                                    <asp:RequiredFieldValidator ID="rfvCreditCardNumber" runat="server" ControlToValidate="txtCardNumber" ErrorMessage="Card detail is required" ForeColor="Red" ValidationGroup="CreditCard">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">Expiry Date</td>
                                <td class="auto-style2">
                                    <asp:DropDownList ID="ddlExpiryMonth" runat="server" ValidationGroup="CreditCard">
                                        <asp:ListItem>01</asp:ListItem>
                                        <asp:ListItem>02</asp:ListItem>
                                        <asp:ListItem>03</asp:ListItem>
                                        <asp:ListItem>04</asp:ListItem>
                                        <asp:ListItem>05</asp:ListItem>
                                        <asp:ListItem>06</asp:ListItem>
                                        <asp:ListItem>07</asp:ListItem>
                                        <asp:ListItem>08</asp:ListItem>
                                        <asp:ListItem>09</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;<asp:DropDownList ID="ddlExpiryYear" runat="server" ValidationGroup="CreditCard">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:DroneDBConnectionString %>" SelectCommand="SELECT [CountryID], [CountryName] FROM [CountryList]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:CustomValidator ID="cvExpiryDate" runat="server" ErrorMessage="Expiry date is not valid" ForeColor="Red" ControlToValidate="ddlExpiryMonth" OnServerValidate="cvExpiryDate_ServerValidate" ValidationGroup="CreditCard">*</asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">CVV</td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="txtCVV" runat="server" MaxLength="3" Width="59px" TextMode="Number" ValidationGroup="CreditCard"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:CustomValidator ID="cvCVV" runat="server" ErrorMessage="CVV is invalid" ForeColor="Red" ControlToValidate="txtCVV" OnServerValidate="cvCVV_ServerValidate" ValidationGroup="CreditCard">*</asp:CustomValidator>
                                    <asp:RequiredFieldValidator ID="rfvCVV" runat="server" ControlToValidate="txtCVV" ErrorMessage="Card detail is required" ForeColor="Red" ValidationGroup="CreditCard">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">&nbsp;</td>
                                <td class="auto-style2">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="CreditCard" />
                                    &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" Text="Cancel" OnClick="btnCancel_Click" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style14">&nbsp;</td>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="vsCreditCard" runat="server" ForeColor="Red" HeaderText="Please update the following fields" ValidationGroup="CreditCard" />
                                </td>
                            </tr>
                        </table>

                    </asp:View>
                    <asp:View ID="vBillingDetails" runat="server">

                        <table style="width: 100%;">
                            <tr>
                                <td colspan="3"><strong>Billing Information<br />
                                </strong>
                                    <br />
                                    <asp:Label ID="lblCardInfo" runat="server" Text="Card Info"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style18">First name *</td>
                                <td class="auto-style19">
                                    <asp:TextBox ID="txtFirstname" runat="server" ValidationGroup="BillingInfo"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvFirstname" runat="server" ControlToValidate="txtFirstname" ErrorMessage="First name is required" ForeColor="Red" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style18">Last name *</td>
                                <td class="auto-style19">
                                    <asp:TextBox ID="txtLastname" runat="server" ValidationGroup="BillingInfo"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvLastname" runat="server" ErrorMessage="Last name is required" ForeColor="Red" ControlToValidate="txtLastname" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style18">Address 1 *</td>
                                <td class="auto-style19">
                                    <asp:TextBox ID="txtAddress1" runat="server" Width="260px" ValidationGroup="BillingInfo"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address line 1 is required" ForeColor="Red" ControlToValidate="txtAddress1" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style18">Address 2</td>
                                <td class="auto-style19">
                                    <asp:TextBox ID="txtAddress2" runat="server" Width="257px" ValidationGroup="BillingInfo"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style18">City</td>
                                <td class="auto-style19">
                                    <asp:TextBox ID="txtCity" runat="server" ValidationGroup="BillingInfo"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style18">Country *</td>
                                <td class="auto-style19">
                                    <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="dsCountry" DataTextField="CountryName" DataValueField="CountryID" ValidationGroup="BillingInfo">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="Country is required" ForeColor="Red" ControlToValidate="ddlCountry" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td class="auto-style18">Post Code *</td>
                                <td class="auto-style19">
                                    <asp:TextBox ID="txtPostCode" runat="server" ValidationGroup="BillingInfo"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvPostcode" runat="server" ErrorMessage="Post code is required" ForeColor="Red" ControlToValidate="txtPostCode" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style19">
                                    <asp:Button ID="btnComplete" runat="server" Text="Complete Purchase" Width="168px" OnClick="btnComplete_Click" ValidationGroup="BillingInfo" />
                                    &nbsp;<asp:Button ID="btnCancelBilling" runat="server" CausesValidation="False" Text="Cancel" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style19">
                                    <asp:ValidationSummary ID="vsBilling" runat="server" ForeColor="Red" HeaderText="Please update the following fields" ValidationGroup="BillingInfo" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                             <tr>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style19">
                                    <asp:Label ID="lblPaymentMessage" runat="server"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                    </asp:View>
                    <asp:View ID="vConfirmation" runat="server">
                        <div class="auto-style20" style="color: #00CC00">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            <strong>
                                <br />
                                <br />
                            </strong>
                            <asp:Button ID="btnBackToCatalogue" runat="server" Text="Back to Catalogue" />
                        </div>
                    </asp:View>
                </asp:MultiView>
            </div>
        </div>
    </div>

</asp:Content>
