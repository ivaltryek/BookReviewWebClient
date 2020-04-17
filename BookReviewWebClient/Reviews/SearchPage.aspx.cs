using BookReviewWebClient.BookService;
using BookReviewWebClient.ReviewService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookReviewWebClient.Reviews
{
    public partial class SearchPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using(BookOperationServiceClient bookOperationServiceClient = new BookOperationServiceClient())
            {
                try
                {
                    var searchResults = bookOperationServiceClient.FindBookByName(Request.QueryString["s"]);
                    foreach(var result in searchResults)
                    {
                        ReviewServiceClient reviewServiceClient = new ReviewServiceClient();
                        reviewServiceClient.CountBookReviewScore(result.BookName);
                    }
                    searchedResultView.DataSource = searchResults;
                    searchedResultView.DataBind();
                }
                catch(Exception)
                {
                    Response.Write("Could not find any books named: " + Request.QueryString["s"]);
                }
                
            }
        }

        protected void searchedResultView_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = searchedResultView.SelectedRow;
            Session["ReviewBookName"]= row.Cells[2].Text;
            Response.Redirect("~/Reviews/PostReview");

            
        }
    }
}