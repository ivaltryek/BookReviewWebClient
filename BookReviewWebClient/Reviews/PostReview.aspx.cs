using BookReviewWebClient.ReviewService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookReviewWebClient.Reviews
{
    public partial class PostReview : System.Web.UI.Page
    {
        public bool editFlag = false;
        public List<BookReviewWebClient.ReviewService.Review> reviewList;
        public string message;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userName"] == null)
            {
                postReviewBtn.Enabled = false;
                errLbl.Text = "You may need to Login first to Post A review and as well as to view comments.";
                return;
            }
            
            using(ReviewServiceClient reviewServiceClient = new ReviewServiceClient())
            {
                
                try
                {
                    reviewList = reviewServiceClient.GetBookReviews(Session["ReviewBookName"].ToString()).ToList();

                    if (Session["userName"] != null)
                    {

                        var existsReview = reviewServiceClient.DoesReviewExists(Session["userName"].ToString(), Session["ReviewBookName"].ToString());
                        if (existsReview != null)
                        {
                            postReviewBtn.Text = "Edit";
                            editFlag = true;
                            previousCommentLbl.Text = "Previous Comment: " + existsReview.ReviewComment.ToString();
                            previousScaleLbl.Text = "Previous Scale: " + existsReview.ReviewScale.ToString();

                        }
                    }
                }
                catch(Exception)
                {
                   
                }
              
            }
           
        }

        protected void postReviewBtn_Click(object sender, EventArgs e)
        {
            using(ReviewServiceClient reviewServiceClient = new ReviewServiceClient())
            {
                var review = new BookReviewWebClient.ReviewService.Review
                {
                    ReviewBy = Session["userName"].ToString(),
                    ReviewComment = reviewCommentTxt.Text.ToString(),
                    ReviewOn = Session["ReviewBookName"].ToString(),
                    ReviewScale = Int32.Parse(scaleDropdown.SelectedValue)
                };
                if (postReviewBtn.Text == "Edit" && editFlag)
                {
                    var editedReview = new BookReviewWebClient.ReviewService.Review
                    {
                        ReviewBy = Session["userName"].ToString(),
                        ReviewComment = reviewCommentTxt.Text.ToString(),
                        ReviewOn = Session["ReviewBookName"].ToString(),
                        ReviewScale = Int32.Parse(scaleDropdown.SelectedValue)
                    };
                    var reviewEdit = reviewServiceClient.EditReview(Session["ReviewBookName"].ToString(),
                        Session["userName"].ToString(), editedReview);
                    tipLbl.Text = reviewEdit != null ? "Edited the review.!!" : "Failed to edit the review.!!";
                    if(reviewEdit != null)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Review has been edited.!!, Redirecting in 3 secs..')", true);
                        Response.AddHeader("REFRESH", "3;URL=../Default.aspx");
                    }
                    editedReview = null;
                }
                if (!editFlag)
                {
                    var isSuccessful = reviewServiceClient.SetReview(review);
                    if (isSuccessful != null)
                    {
                        review = null;
                        tipLbl.Text = "Review has been saved.!!, redirecting in 3 secs..";
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Review has been posted.!!')", true);
                        //Response.Redirect("~/Default");
                        Response.AddHeader("REFRESH", "3;URL=../Default.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage",
                            "alert('Oops, this wasn't supposed to happen. Please try again')", true);
                    }
                }
                
            }
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            using(ReviewServiceClient reviewServiceClient = new ReviewServiceClient())
            {
                int affectedRow = reviewServiceClient.DeleteReview(Session["ReviewBookName"].ToString(), Session["userName"].ToString());
                tipLbl.Text = affectedRow != 0 ? "Review has been deleted.!!, redirecting to home in 3 secs." : "Failed to delete the review.!!";
                Response.AddHeader("REFRESH", "3;URL=../Default.aspx");

            }
        }
    }
}