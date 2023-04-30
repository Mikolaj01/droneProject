using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace draftProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dsProjectTableAdapters.AdminUserTableAdapter users = new dsProjectTableAdapters.AdminUserTableAdapter();
                DropDownList1.DataSource = users.GetAllAdminIDs();
                DropDownList1.DataTextField = "UserID";
                DropDownList1.DataValueField = "UserID";
                DropDownList1.DataBind();
            }
        }

        protected void lblRetrieve_Click(object sender, EventArgs e)
        {
            dsProjectTableAdapters.AdminUserTableAdapter users = new dsProjectTableAdapters.AdminUserTableAdapter();


            DataTable adminUser = new DataTable();
            adminUser = users.GetAdminUserByID(int.Parse(DropDownList1.SelectedValue));

            txtFirstname.Text = adminUser.Rows[0]["Firstname"].ToString();
            txtLastname.Text = adminUser.Rows[0]["Lastname"].ToString();
            txtSignupPassword.Text = adminUser.Rows[0]["Password"].ToString();
            txtSignupUsername.Text = adminUser.Rows[0]["Username"].ToString();
        }

        protected void lblUpdate_Click(object sender, EventArgs e)
        {
            dsProjectTableAdapters.AdminUserTableAdapter users = new dsProjectTableAdapters.AdminUserTableAdapter();

            users.UpdateUsers(txtSignupUsername.Text, txtSignupPassword.Text, txtFirstname.Text, txtLastname.Text, true, DateTime.Now, int.Parse(DropDownList1.SelectedValue.ToString()));

            Response.Redirect(Request.RawUrl); // redirect the user to the page itself
        }

        protected void lblDelete_Click(object sender, EventArgs e)
        {
            dsProjectTableAdapters.AdminUserTableAdapter users = new dsProjectTableAdapters.AdminUserTableAdapter();
            users.DeleteUser(int.Parse(DropDownList1.SelectedValue.ToString()));

            Response.Redirect(Request.RawUrl);
        }
    }
}