<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="draftProject.products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row-prod">


            <div class="col-md-8 order-md-1">

                <asp:MultiView ID="mvMain" runat="server" ActiveViewIndex="0">
                    <asp:View ID="vCatalogue" runat="server">
                        <asp:Panel ID="pnlSearch" runat="server" BackColor="#56ae6c" BorderColor="#0066FF" Height="2.3em">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="auto-style17">Search
                            <asp:TextBox ID="txtSearch" runat="server" Width="117px"></asp:TextBox>
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rblSearchType" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblSearchType_SelectedIndexChanged">
                                            <asp:ListItem Selected="True">Name</asp:ListItem>
                                            <asp:ListItem>Price</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rblSortOrder" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblSortOrder_SelectedIndexChanged">
                                            <asp:ListItem Selected="True">ASC</asp:ListItem>
                                            <asp:ListItem>DESC</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <h4 class="mb-3">Products Catalogue</h4>
                        <div class="text-center">
                            <asp:DataList ID="dlCatalogue" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="20" CellSpacing="20" DataKeyField="ProductID" DataSourceID="sdsCatalogue" ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center" OnSelectedIndexChanged="dlCatalogue_SelectedIndexChanged" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="dlCatalogue_ItemCommand">
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <ItemTemplate>
                                    &nbsp;<asp:Label ID="ProductNameLabel" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# Eval("ProductName") %>' />
                                    <br />
                                    £<asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                                    <br />
                                    <asp:Image ID="imgPix" runat="server" Height="150px" ImageUrl='<%# Eval("ImagePath", "images/{0}") %>' Width="200px" />
                                    <br />
                                    <br />
                                    <asp:Button ID="btnViewDetail" CssClass="btn btn-success" runat="server" OnClick="Button1_Click" Text="View" CommandArgument='<%# Eval("ProductID")%>' CommandName="ProductID" />
                                    <br />
                                </ItemTemplate>
                                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            </asp:DataList>
                        </div>


                        <asp:SqlDataSource ID="sdsCatalogue" runat="server" ConnectionString="<%$ ConnectionStrings:DroneDBConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>

                        <br />
                        <asp:HiddenField ID="hfProductID" runat="server" />

                    </asp:View>
                    <asp:View ID="vDetails" runat="server">
                        <table class="vdetail" style="width: 100%;">
                            <tr>
                                <td class="auto-style16">
                                    <strong>
                                        <asp:Label ID="lblProdName" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#59AB6E"></asp:Label>
                                    </strong>
                                    <br />
                                    <asp:Label ID="lblProdDesc" runat="server" Font-Italic="True" ForeColor="Black"></asp:Label>
                                    <br />
                                    <br />
                                    <br />
                                    <asp:Image ID="imgDetails" runat="server" Height="200px" Width="230px" />
                                </td>
                                <td rowspan="4">&nbsp; Price: £<asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
                                    <br />
                                    
                                    <br />
                                    &nbsp;Quantity:
                                    <asp:TextBox ID="txtQuantity" runat="server" Width="41px" OnTextChanged="txtQuantity_TextChanged" TextMode="Number"></asp:TextBox>
                                    <asp:Button ID="btnCalculate" runat="server" Text="Recalculate" OnClick="btnCalculate_Click" CssClass="btn btn-primary" />

                                    <br />
                                    <br />
                                    &nbsp;Total Amount: £<asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                                    <asp:Button ID="btnAddToBasket" runat="server" Text="Add to basket" OnClick="btnAddToBasket_Click" CssClass="btn btn-success" />
                                    <br />
                                    <br />
                                    &nbsp;<asp:Button ID="btnCheckOut" runat="server" Text="Checkout" OnClick="btnCheckOut_Click" CssClass="btn btn-success"/>
                                </td>
                            </tr>

                        </table>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbGoToCatalogue" href="products.aspx" runat="server">&lt;&lt; Go back to catalogue</asp:LinkButton>
                    </asp:View>
                    <asp:View ID="vSummary" runat="server">
                        <asp:LinkButton ID="lbContinueShopping" runat="server">&lt;&lt; Continue Shopping</asp:LinkButton>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnPayNow" runat="server" Text="Pay Now" />
                    </asp:View>
                </asp:MultiView>
            </div>
        </div>


    </div>


</asp:Content>

