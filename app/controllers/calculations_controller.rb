#write static mockup first in view template, then substitute dynamic outputs

class CalculationsController < ApplicationController
    def flex_square
        #The incoming parameters for this action look like {"number"=> "user's number"}
        #Rails stores that hash in a variable called params
        
        @user_number = params["number"].to_i      #convert string to integer
        @squared_number = @user_number**2        #access element in a hash
        
        render("calculations/flexible_square_template.html.erb")
    end

    def flex_square_root
        
        @user_number = params["a_number"].to_i      
        @square_root_number = @user_number**0.5        
        
        render("calculations/flexible_square_root_template.html.erb")
    end

    def flex_payment
        
        @percent = params["basis_points"].to_i
        @apr = @percent.to_percentage
        @mpr = @apr/12
        @years = params["number_of_years"].to_i
        @principal = params["present_value"].to_i
        
        @payment = @mpr*@principal/(1-(1+@mpr)**(-12*@years))
        
        render("calculations/flexible_payment_template.html.erb")
    end
    
    def flex_random
        
        @user_number = params["a_number"].to_i      #convert string to integer
        @squared_number = @user_number**2        #access element in a hash
        
        render("calculations/flexible_random_template.html.erb")
    end

    def square_form
      
      render("calculations/square_form_template.html.erb")  
    end

end