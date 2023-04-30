using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace draftProject
{
    public partial class products : System.Web.UI.Page

    {
        List<BasketItem> basket = new List<BasketItem>();

        public int BasketCount()
        {
            return basket.Count;
        }

        public float BasketAmount()
        {
            float amount = 0.0f;
            foreach (BasketItem item in basket)
            {
                amount += item.UnitPrice * item.Quantity;
            }
            return amount;
        }

        public void UpdateMaster()
        {
            Label masterAmount, masterCount;
            masterAmount = (Label)Master.FindControl("lblAmount");
            masterCount = (Label)Master.FindControl("lblCount");
            if (!(masterAmount == null || masterCount == null || basket == null))
            {
                masterCount.Text = basket.Count.ToString();
                masterAmount.Text = BasketAmount().ToString();
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack && Session["Basket"] == null)
            {
                Session["SessionID"] = Guid.NewGuid().ToString();
                Session["Basket"] = null;
            }
            else
            {
                basket = (List<BasketItem>)Session["Basket"];
                UpdateMaster();
            }
        }

        protected void dlCatalogue_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void dlCatalogue_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ProductID")
            {
                int productID = Convert.ToInt32(e.CommandArgument);
                dsProjectTableAdapters.ProductsTableAdapter service = new dsProjectTableAdapters.ProductsTableAdapter();
                dsProject.ProductsDataTable row = service.GetProductByID(productID);

                if (row != null && row.Count > 0)
                {
                    imgDetails.ImageUrl = "Images/" + row[0]["ImagePath"].ToString();
                    lblProdName.Text = row[0]["ProductName"].ToString();
                    lblProdDesc.Text = row[0]["Description"].ToString();
                    lblUnitPrice.Text = row[0]["Price"].ToString();
                    txtQuantity.Text = "1"; //by default quantity is one
                    lblTotalAmount.Text = lblUnitPrice.Text;
                    hfProductID.Value = e.CommandArgument.ToString();
                    mvMain.SetActiveView(vDetails);
                }
            }
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if (lblUnitPrice.Text != "")
            {
                lblTotalAmount.Text = (Convert.ToDouble(lblUnitPrice.Text) * Convert.ToDouble(txtQuantity.Text)).ToString();
            }
        }

        protected void btnAddToBasket_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtQuantity.Text) >= 1)
            {
                BasketItem item = new BasketItem();
                item.SessionID = Session["SessionID"].ToString();
                item.ProductID = Convert.ToInt32(hfProductID.Value);
                item.ProductName = lblProdName.Text;
                item.Quantity = Convert.ToInt32(txtQuantity.Text);
                item.UnitPrice = float.Parse(lblUnitPrice.Text);
                item.Amount = item.UnitPrice * item.Quantity;

                if (basket == null)
                    basket = new List<BasketItem>();
                else
                {
                    foreach (BasketItem basketItem in basket)
                    {
                        if (basketItem.ProductID == item.ProductID)
                        {
                            basket.Remove(basketItem);
                            break;
                        }
                    }
                }

                txtQuantity.Text = "1";

                basket.Add(item);
                Session["Basket"] = basket;

                UpdateMaster();
            }
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("pay.aspx");
        }


        void ReloadCatalogue()
        {
            dsProjectTableAdapters.ProductsTableAdapter catalog = new dsProjectTableAdapters.ProductsTableAdapter();
            dsProject.ProductsDataTable result = new dsProject.ProductsDataTable();

            string searchType = "ProductName";
            string searchOrder = "ASC";

            if (rblSearchType.SelectedValue == "Price")
                searchType = "Price";

            if (rblSortOrder.SelectedValue == "DESC")
                searchOrder = "DESC";

            if (txtSearch.Text.Trim() == "") //get everything (full catalogue)
                result = catalog.GetFullCatalogue();
            else //get catalogue with the search term
                result = catalog.GetSpecificCatalogue(txtSearch.Text);

            //change view/sort order
            result.DefaultView.Sort = searchType + " " + searchOrder;
            dlCatalogue.DataSource = result.DefaultView;

            dlCatalogue.DataSourceID = null; //disable the original datasource 
            dlCatalogue.DataBind();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ReloadCatalogue();
        }

        protected void rblSearchType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ReloadCatalogue();
        }

        protected void rblSortOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            ReloadCatalogue();
        }
    }
}