using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace draftProject
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {// If session variable is not empty, session user already login
                Response.Redirect("admin.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // If the username and password match the hardcoded details the user will be directed to the admin page.
            if (txtUname.Text == "admin" && txtPass.Text == "pass")
            {
                Session["user"] = txtUname.Text;
                Response.Redirect("admin.aspx");
            }
            else
            {
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}