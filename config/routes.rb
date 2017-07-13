Rails.application.routes.draw do
  
  get("/flexible/square/:number",{ :controller=>"calculations", :action=>"flex_square"})    #:segment 
  get("/flexible/square_root/:a_number",{ :controller=>"calculations", :action=>"flex_square_root"})
  get("/flexible/payment/:basis_points/:number_of_years/:present_value",{ :controller=>"calculations", :action=>"flex_payment"})
  get("/flexible/random/:min/:max",{ :controller=>"calculations", :action=>"flex_random"})
  
  get("/square/new", { :controller=>"calculations", :action=>"square_form"})
  get("/square/result", { :controller=>"calculations", :action=>"process_square"})
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
