using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace C__Project_Management_System
{
    public partial class afterLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Session["key1"].ToString();
            LabelUser.Text = name + "▼";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            // End the current user session
            Session.Abandon();
            // Redirect to the mainPage.html
            Response.Redirect("mainPage.html");
        }

    }
}