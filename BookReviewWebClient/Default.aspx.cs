using BookReviewWebClient.BookService;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookReviewWebClient
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register");
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {

           if(!searchTxt.Text.ToString().IsNullOrWhiteSpace())
            {
                Response.Redirect("~/Reviews/SearchPage?s=" + searchTxt.Text.Trim());
            }
        }
    }
}