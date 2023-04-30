using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace draftProject
{
    public partial class pay : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //Retrieve or create basket from session
            if (Session["Basket"] == null)
            {
                Response.Redirect("products.aspx");
            }
            else
            {
                basket = (List<BasketItem>)Session["Basket"];
                lblItemCount.Text = basket.Count.ToString();
                lblSummaryAmount.Text = BasketAmount().ToString();

                UpdateMaster();

                gvSummary.DataSource = basket;
                gvSummary.DataBind();

                //pay button only when there is something in the basket
                if (basket != null && basket.Count > 0)
                {
                    btnPayNow.Visible = true;
                }
                else
                {
                    btnPayNow.Visible = false;
                }

                if (!IsPostBack)
                {
                    //update year
                    int thisYear = DateTime.Now.Year;
                    for (int yr = thisYear; yr < thisYear + 5; yr++)
                    {
                        ddlExpiryYear.Items.Add(new ListItem(yr.ToString()));
                    }

                    //update month
                    int thisMonth = DateTime.Now.Month;
                    ddlExpiryMonth.SelectedIndex = thisMonth - 1;
                }

                mvMain.SetActiveView(vSummary);
            }
        }

        List<BasketItem> basket = new List<BasketItem>(); //Create the basket



        public float BasketAmount() //calculate total amount in the basket
        {
            float amount = 0.0f;
            foreach (BasketItem item in basket)
            {
                amount += item.UnitPrice * item.Quantity;
            }
            return amount;
        }
        public int BasketCount() //count items in the basket
        {
            return basket.Count;
        }

        public void UpdateMaster() //Update master page
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


        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if (lblUnitPrice.Text != "") //if unit price is not empty then re-calculate amount
            {
                lblAmount.Text = (Convert.ToDouble(rlblUnitPrice.Text) * Convert.ToDouble(txtQuantity.Text)).ToString();
            }

        }



        protected void gvSummary_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateItem") //update item in basket
            {
                int row = Convert.ToInt32(e.CommandArgument.ToString());//get the row number

                //update controls
                txtQuantity.Text = basket[row].Quantity.ToString();
                rlblUnitPrice.Text = basket[row].UnitPrice.ToString();
                rlblProductID.Text = basket[row].ProductID.ToString();
                rlblProductName.Text = basket[row].ProductName.ToString();

                hfRowIndex.Value = row.ToString(); //store row number in hidden field

                mvMain.SetActiveView(vUpdate); //change view
            }
            else if (e.CommandName == "RemoveItem") //remove item from basket
            {
                int row = Convert.ToInt32(e.CommandArgument.ToString()); //get id

                basket.RemoveAt(row);

                lblSummaryAmount.Text = BasketAmount().ToString();
                lblItemCount.Text = basket.Count().ToString();
                lblAmount.Text = BasketAmount().ToString();

                gvSummary.DataSource = basket;
                gvSummary.DataBind();

                UpdateMaster();

                mvMain.SetActiveView(vSummary);
            }
        }

        protected void btnCalculate_Click1(object sender, EventArgs e)
        {
            if (lblUnitPrice.Text != "") //if unit price is not empty then re-calculate amount
            {
                lblAmount.Text = (Convert.ToDouble(rlblUnitPrice.Text) * Convert.ToDouble(txtQuantity.Text)).ToString();
            }
        }

        protected void btnUpdateBasket_Click1(object sender, EventArgs e)
        {
            int row = Convert.ToInt32(hfRowIndex.Value); //get the row

            basket[row].Quantity = Convert.ToInt32(txtQuantity.Text);
            basket[row].Amount = (float)(Convert.ToDouble(rlblUnitPrice.Text) * Convert.ToDouble(txtQuantity.Text));

            lblSummaryAmount.Text = BasketAmount().ToString();
            lblItemCount.Text = basket.Count().ToString();
            lblAmount.Text = BasketAmount().ToString();

            UpdateMaster();//update master page

            //update gridview
            gvSummary.DataSource = basket;
            gvSummary.DataBind();

            //change view
            mvMain.SetActiveView(vSummary);
        }

        protected void btnPayNow_Click1(object sender, EventArgs e)
        {

            //user is logged in move to billing
            if (!(Session["CustomerID"] is null))
            {
                mvMain.SetActiveView(vCardDetails);
            }
            else //if not loged in
            {
                Response.Redirect("~/UserLogin.aspx");
            }
        }

        protected void cvExpiryDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //Check if the expiration date is valid.

            //Get the year entered
            int ExpirationYear = Convert.ToInt32(ddlExpiryYear.SelectedValue);
            int ThisYear = DateTime.Now.Year;

            //If the expiration year is equal to today's year then check that the month is later
            if (ExpirationYear == ThisYear)
            {
                int ExpirationMonth = Convert.ToInt32(ddlExpiryMonth.SelectedValue);
                int ThisMonth = DateTime.Now.Month;
                if (ExpirationMonth < ThisMonth)
                {
                    cvExpiryDate.ErrorMessage = "The expiration date selected is in the past.";
                    args.IsValid = false;
                }
            }
        }

        protected void cvCVV_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (txtCVV.Text.Length != 3)
            {
                cvCVV.ErrorMessage = "Please enter valid CVV";
                args.IsValid = false;

            }
        }

        protected void cvCardNumber_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //this code is adapted from:
            //https://www.prowaretech.com/articles/archived/asp-net/validate-credit-card-number#!
            //http://www.aboutfortunate.com/Code-Repository.aspx?pageindex=2&entryid=53

            //Create a regular expression object to check the creditcard number against.
            System.Text.RegularExpressions.Regex RegEx = null;
            if (ddlCardType.SelectedValue == "American Express")
                RegEx = new System.Text.RegularExpressions.Regex("3[4,7]\\d{13}");
            else if (ddlCardType.SelectedValue == "Discover")
                RegEx = new System.Text.RegularExpressions.Regex("6011-?\\d{4}-?\\d{4}-?\\d{4}");
            else if (ddlCardType.SelectedValue == "Master Card")
                RegEx = new System.Text.RegularExpressions.Regex("5[1-5]\\d{2}-?\\d{4}-?\\d{4}-?\\d{4");
            else if (ddlCardType.SelectedValue == "Visa")
                RegEx = new System.Text.RegularExpressions.Regex("4\\d{3}-?\\d{4}-?\\d{4}-?\\d{4}");

            //Get the credit card number
            string CreditCardNumber = txtCardNumber.Text.Trim().Replace("-", "");

            //If the regular expression matches then also validate with a checksum.
            //If it doesn't then just don't submit the page.

            if (CreditCardNumber.Length > 4 && !(RegEx == null) && (RegEx.Match(txtCardNumber.Text).Success))
            {
                System.Collections.Generic.IEnumerable<char> rev = CreditCardNumber.Reverse();
                int sum = 0, i = 0;
                foreach (char c in rev)
                {
                    if (c < '0' || c > '9') //check if each digit is a number
                    {
                        cvCardNumber.ErrorMessage = "Please enter a valid card number.";
                        args.IsValid = false;
                    }

                    int tmp = c - '0';
                    if ((i & 1) != 0)
                    {
                        tmp <<= 1;
                        if (tmp > 9)
                            tmp -= 9;
                    }
                    sum += tmp;
                    i++;
                }

                if (!((sum % 10) == 0))
                {
                    cvCardNumber.ErrorMessage = "Please enter a valid card number.";
                    args.IsValid = false;
                }
            }
            else
            {
                cvCardNumber.ErrorMessage = "Please enter a valid card number.";
                args.IsValid = false;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            mvMain.SetActiveView(vSummary);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Page.Validate("CreditCard");
            if (Page.IsValid)
            {
                //get last 4 digits of credit card
                lblCardInfo.Text = "Billing card is ****" + txtCardNumber.Text.Substring(txtCardNumber.Text.Length - 4);

                mvMain.SetActiveView(vBillingDetails);
            }
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            Page.Validate("BillingInfo");
            if (Page.IsValid && !(Session["CustomerID"] is null))
            {
                int customerID = (int)Session["CustomerID"];

                try
                {
                    //insert order
                    dsProjectTableAdapters.OrderTableAdapter order = new dsProjectTableAdapters.OrderTableAdapter();
                    int orderID = order.InsertNewOrder(customerID, Session["SessionID"].ToString(), DateTime.Now);

                    //insert order detail
                    foreach (BasketItem item in basket) //save each item in the basket
                    {
                        dsProjectTableAdapters.OrderDetailTableAdapter detail = new dsProjectTableAdapters.OrderDetailTableAdapter();
                        detail.InsertNewOrderDetails(orderID, item.ProductID, item.ProductName, "payment", Convert.ToDecimal(item.UnitPrice), item.Quantity);
                    }

                    //save card info
                    dsProjectTableAdapters.CardInformationTableAdapter card = new dsProjectTableAdapters.CardInformationTableAdapter();
                    card.InsertNewCardInfo(txtCardNumber.Text, ddlCardType.SelectedItem.Text, Convert.ToInt32(ddlExpiryMonth.SelectedItem.Text), Convert.ToInt32(ddlExpiryYear.SelectedItem.Text), Convert.ToInt32(txtCVV.Text));

                    //billing info
                    dsProjectTableAdapters.BillingInfoTableAdapter billing = new dsProjectTableAdapters.BillingInfoTableAdapter();
                    billing.InsertNewBilling(txtCardNumber.Text, txtFirstname.Text, txtLastname.Text, txtAddress1.Text, txtAddress2.Text, txtCity.Text, ddlCountry.SelectedItem.Text, txtPostCode.Text);

                    //success message
                    lblMessage.Text = "Your transaction was successful. Thank you for using our service.";

                    
                    UpdateMaster();

                    lblSummaryAmount.Text = BasketAmount().ToString();
                    lblItemCount.Text = basket.Count().ToString();
                    lblAmount.Text = BasketAmount().ToString();

                    mvMain.SetActiveView(vConfirmation);
                }
                catch (Exception ex)
                {
                    lblPaymentMessage.Text = "Sorry an error occured saving your order: " + ex.Message;
                }
            }
        }

    }
}