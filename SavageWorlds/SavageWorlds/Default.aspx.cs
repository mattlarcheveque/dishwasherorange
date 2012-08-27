using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


//Add MySql Library
using MySql.Data.MySqlClient;

namespace SavageWorlds
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            DBConnect db = new DBConnect();

            List<String>[] results = db.Select("select * from view_all_characters");

            test1.Text = results[1][1];
        }
        
    }
}
