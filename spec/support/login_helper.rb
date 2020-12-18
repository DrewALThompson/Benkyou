module LoginHelper

    def user_signup
        fill_in("user[name]", :with => "Mike")
        fill_in("user[email]", :with => "Mike@mike.com")
        fill_in("user[password]", :with => "password")
        fill_in("user[password_confirmation"), :with => "password")
        click_button('Create User')
      end
    
      def user_login
        fill_in("user[name]", :with => "Mike")
        fill_in("user_password", :with => "password")
        click_button('Sign In')
      end
    
    
      def create_standard_user 
        @user = User.create(
            name: "Mike",
            email: "mike@mike.com",
            password: "password"
        )
      end
    
      def create_admin_user
        @user = User.create(
            name: "イビルジョー",
            email: "deviljho@deviljho.com",
            password: "password",
            admin: true
        )
      end
end