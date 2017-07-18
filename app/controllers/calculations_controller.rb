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
        
        @percent = params["basis_points"].to_f
        @apr = @percent/10000
        @mpr = @apr/12
        @years = params["number_of_years"].to_i
        @months = @years*12
        @principal = params["present_value"].to_i
        
        @payment = @mpr*@principal/(1-(1+@mpr)**(-@months))
        
        render("calculations/flexible_payment_template.html.erb")
    end
    
    def flex_random
        
        @min = params["min"].to_i 
        @max = params["max"].to_i
        @rand = rand(@min...@max)        
        
        render("calculations/flexible_random_template.html.erb")
    end

    def square_form
        
      render("calculations/square_form_template.html.erb")  
    end
    
    def process_square
     
      @user_number = params["the_user_number"].to_i      
        @squared_number = @user_number**2        
     render("calculations/square_results_template.html.erb")   
    end
    
    def square_root_form
        
      render("calculations/square_root_form_template.html.erb")  
    end

    def process_square_root
     
       @user_number = params["the_user_number"].to_i      
        @square_root_number = @user_number**0.5
        
     render("calculations/square_root_results_template.html.erb")   
    end

    def payment_form
        
      render("calculations/payment_form_template.html.erb")  
    end

    def process_payment
     
        @percent = params["the_user_apr"].to_f
        @apr = @percent/100
        @mpr = @apr/12
        @years = params["the_user_years"].to_i
        @months = @years*12
        @principal = params["the_user_principal"].to_i
        
        @payment = @mpr*@principal/(1-(1+@mpr)**(-@months))
        
     render("calculations/payment_results_template.html.erb")   
    end

    def random_form
        
      render("calculations/random_form_template.html.erb")  
    end

    def process_random
     
       @min = params["the_user_min"].to_i 
        @max = params["the_user_max"].to_i
        @rand = rand(@min...@max)
        
     render("calculations/random_results_template.html.erb")   
    end

    def word_form
        
      render("calculations/word_form_template.html.erb")  
    end

    def process_word
     
        @text = params["the_user_text"]
        @special_word = params["the_user_word"]
        @word_count = @text.split.count
        @character_count_with_spaces = @text.length
        @character_count_without_spaces = @text.gsub(/\s+/, "").length
        @occurrences = @text.split.count (@special_word)
        
     render("calculations/word_results_template.html.erb")   
    end

    def stats_form
        
      render("calculations/stats_form_template.html.erb")  
    end

    def process_stats
     
        @numbers = params["the_user_number"].gsub(',', '').split.map(&:to_f)

        @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max - @numbers.min

    if @count.to_i.even? 
      @median = (@sorted_numbers[@count/2]+@sorted_numbers[@count/2-1])/2
      else
        @median = @sorted_numbers[@count/2]
    end

    @sum = @numbers.sum

    @mean = @sum/@count
    
    v = []
    @numbers. each do |num|
      correlated_mean_diff = (num - @mean) ** 2 / @count
      v.push(correlated_mean_diff)
    end
    @variance = v.sum

    @standard_deviation = @variance ** 0.5

    prelim_mode = 0
    mode_count = 0
    
    @numbers.each do |numb|
      if @numbers.count(numb) > mode_count
        prelim_mode = numb
        mode_count = @numbers.count(numb)
      end
    end
    @mode = prelim_mode
    

        
    render("calculations/stats_results_template.html.erb")   
    end

end