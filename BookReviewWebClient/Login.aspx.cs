using BookReviewWebClient.UserService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookReviewWebClient
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void logInNowBtn_Click(object sender, EventArgs e)
        {
            UserServiceClient userServiceClient = new UserServiceClient();
            string userEmailTxt = emailTxt.Text.ToString();
            string userPasswordTxt = passwordTxt.Text.ToString();
            var user = userServiceClient.LoginUser(userEmailTxt, userPasswordTxt);
            if(user != null)
            {

                Session["userEmail"] = user.UserEmail.ToString();
                Session["userName"] = user.UserName.ToString();
                Session["userType"] = user.UserType.ToString();
                Response.Redirect("~/Default");
            }
            else
            {
                errorLabel.Text = "Entered Credentials seems wrong.!! Please Try again by reentering them.";
            }
        }
    }
}