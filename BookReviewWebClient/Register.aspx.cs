using BookReviewWebClient.UserService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookReviewWebClient
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            BookReviewWebClient.UserService.User createdUser = null;
            using (UserServiceClient userServiceClient = new UserServiceClient())
            {
                var user = new BookReviewWebClient.UserService.User
                {
                    FirstName = firstNameTxt.Text.ToString(),
                    LastName = lastNameTxt.Text.ToString(),
                    UserEmail = userEmailTxt.Text.ToString(),
                    UserName = userNameTxt.Text.ToString(),
                    UserPassword = passwordTxt.Text.ToString()
                };
                if (userServiceClient.DoesUserNameExists(userNameTxt.Text.ToString()))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username does already exists!!')", true);

                    Label1.Text = "Username does already exists!!";

                }else
                {
                    createdUser = userServiceClient.RegisterUser(user);
                    if(createdUser != null)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You have been registered, redirecting in 3 secs..')", true);
                        Response.AddHeader("REFRESH", "3;URL=../Default.aspx");
                    }
                }
               
                
                errorLbl.Text = createdUser == null ? "Failed to register, Please try again" : "";
            }
        }

        protected void userNameTxt_TextChanged(object sender, EventArgs e)
        {
            using (UserServiceClient userServiceClient = new UserServiceClient())
            {
                bool status = userServiceClient.DoesUserNameExists(userNameTxt.Text.ToString());
                errorLbl.Text = status == true ? "Username already exists" : "";
            }
        }
    }
}