using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace draftProject
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["attempts"] = 3;
                lblAttempts.Text = "Please enter first name - 3 attempts";
            }
        }

        void ChangePH(bool ph)
        {
            phLogin.Visible = ph;
            phSignup.Visible = !ph;
        }

        protected void lbLogin_Click(object sender, EventArgs e)
        {
            ChangePH(true);
        }

        protected void lbSignup_Click(object sender, EventArgs e)
        {
            ChangePH(false);

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //go to database and retrieve row with password and username
            dsProjectTableAdapters.CustomerTableAdapter customerDB = new dsProjectTableAdapters.CustomerTableAdapter();
            dsProject.CustomerDataTable row = customerDB.CheckCredentials(txtUsername.Text, txtPassword.Text);

            if (row.Count > 0)//there are records
            {
                Session["CustomerID"] = (int)row[0]["CustomerID"]; //store customer id in session

                if (!(Session["basket"] is null)) //if basket is not empty
                    Response.Redirect("~/pay.aspx");
                else//if basket is empty
                    Response.Redirect("~/customerprofile.aspx");

            }

            if ((int)ViewState["attempts"] <= 0)
            {
                Session["attemptsReached"] = true;
                Response.Redirect("~/index.aspx");
            }

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {

            try
            {
                int customerID = 0;

                //insert customer information
                dsProjectTableAdapters.CustomerTableAdapter customerDB = new dsProjectTableAdapters.CustomerTableAdapter();
                customerID = customerDB.InsertAndGetCustomerID(txtFirstname.Text, txtLastname.Text, txtSignupUsername.Text, txtSignupPassword.Text, DateTime.Now, true);

                Session["CustomerID"] = customerID;

                lblMessage.Text = "Signup successful!";
                ChangePH(true);
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }

        }
    }
}