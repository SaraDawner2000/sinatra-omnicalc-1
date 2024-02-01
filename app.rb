require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:landing_page, {:layout => :layout})
end

get("/square/new") do
  erb(:square, {:layout => :layout})
end
get("/square") do
  @square = params[:user_input].to_f ** 2
  erb("<h1><%=@square%></h1>", {:layout => :layout})
end

get("/square_root/new") do
  erb(:square_root, {:layout => :layout})
end
get("/square_root") do
  @square_root = params[:user_input].to_f ** 0.5
  erb("<h1><%=@square_root%></h1>", {:layout => :layout})
end

get("/random/new") do
  erb(:random, {:layout => :layout})
end
get("/random") do
  min = params[:user_min].to_f
  max = params[:user_max].to_f
  @random = rand(min..max)
  erb("<h1><%=@random%></h1>", {:layout => :layout})
end

get("/payment/new") do
  erb(:payment, {:layout => :layout})
end
get("/payment") do
  months = params[:user_years].to_i * 12
  apr = (params[:user_apr].to_f / 100) / 12
  principal = params[:user_principal].to_f

  payment = (apr * principal)/(1 - (1 + apr) ** -months)

  @principal_string = principal.to_fs(:currency)
  @apr_string = apr.to_fs(:percentage, {:precision => 4})
  @payment_string = payment.to_fs(:currency)

  erb(:payment_result, {:layout => :layout})
end
