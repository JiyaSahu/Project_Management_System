using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace C__Project_Management_System
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=SISLOVES06\\SQLEXPRESS;Initial Catalog=bca1;Integrated Security=True");

            con.Open();
            SqlCommand cmd = new SqlCommand("insert into PMS values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "')");
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Response.Write("successFully Login");
            con.Close();
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            TextBox1.Attributes.Add("placeholder", "Email");
        }
    }
}