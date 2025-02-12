using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace C__Project_Management_System
{
    public partial class sigin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=SISLOVES06\\SQLEXPRESS;Initial Catalog=bca1;Integrated Security=True");

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from PMS where username= '" + TextBox1.Text + "'");
            SqlDataReader dr;
            cmd.Connection = con;
            dr = cmd.ExecuteReader();
            Boolean x = true;
            while (dr.Read())
            {
                if (dr[0].ToString() == TextBox1.Text && dr[2].ToString() == TextBox2.Text)
                {
                    string name1 = TextBox1.Text;
                    Session["key1"] = name1;
                    
                    Response.Redirect("afterLogin.aspx");
                    x = false;
                    

                }

            }
            if (x == true)
            {
                Response.Write("Error Incorrect Details..!");
            }
            con.Close();
        }
    }
}