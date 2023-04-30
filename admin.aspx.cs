using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace draftProject
{
    public partial class admin : System.Web.UI.Page
    {
        void ChangePlaceholder(Boolean visible)//change placeholder view
        {
            phLogin.Visible = visible;
            phSignup.Visible = !visible;
        }
     
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void lbLogin_Click(object sender, EventArgs e)

        {
           
            ChangePlaceholder(true);
        }
      


        protected void lbSignup_Click(object sender, EventArgs e)
        {
            ChangePlaceholder(false);
        }
        protected void btnSignup_Click(object sender, EventArgs e)
        {//insert into database
            dsProjectTableAdapters.AdminUserTableAdapter admin = new dsProjectTableAdapters.AdminUserTableAdapter();
            admin.createNewAdminUser(txtSignupUsername.Text, txtSignupPassword.Text, txtFirstname.Text, txtLastname.Text, true, DateTime.Now);

            //reset fields
            txtLastname.Text = "";
            txtPassword.Text = "";
            txtSignupPassword.Text = "";
            txtSignupUsername.Text = "";
            txtFirstname.Text = "";


            //show login
            ChangePlaceholder(true);
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //go to database and retrieve row with password and username
            dsProjectTableAdapters.AdminUserTableAdapter admin = new dsProjectTableAdapters.AdminUserTableAdapter();
            dsProject.AdminUserDataTable row = admin.CheckCredentials(txtUsername.Text, txtPassword.Text);

            if (row.Count > 0)//there are records
            {
                
                    Response.Redirect("~/crudAdmin.aspx");
               
            }
            else
            {
                lblErrorMessage.Text = "Invalid username or password.";
            }

        }
    }
}