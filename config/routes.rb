Rails.application.routes.draw do
  
  get("/",{ :controller=>"calculations", :action=>"square_form"})
  
  get("/flexible/square/:number",{ :controller=>"calculations", :action=>"flex_square"})    #:segment 
  get("/flexible/square_root/:a_number",{ :controller=>"calculations", :action=>"flex_square_root"})
  get("/flexible/payment/:basis_points/:number_of_years/:present_value",{ :controller=>"calculations", :action=>"flex_payment"})
  get("/flexible/random/:min/:max",{ :controller=>"calculations", :action=>"flex_random"})
  
  get("/square/new", { :controller=>"calculations", :action=>"square_form"})
  get("/square/result", { :controller=>"calculations", :action=>"process_square"})
  get("/squareroot/new", { :controller=>"calculations", :action=>"square_root_form"})
  get("/squareroot/result", { :controller=>"calculations", :action=>"process_square_root"})
  get("/payment/new", { :controller=>"calculations", :action=>"payment_form"})
  get("/payment/result", { :controller=>"calculations", :action=>"process_payment"})
  get("/random/new", { :controller=>"calculations", :action=>"random_form"})
  get("/random/result", { :controller=>"calculations", :action=>"process_random"})
  
  get("/word/new", { :controller=>"calculations", :action=>"word_form"})
  get("/word/result", { :controller=>"calculations", :action=>"process_word"})
  get("/stats/new", { :controller=>"calculations", :action=>"stats_form"})
  get("/stats/result", { :controller=>"calculations", :action=>"process_stats"})
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
