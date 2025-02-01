require "sinatra"
require "sinatra/reloader"


get("/square/new") do
  erb(:new_square_calc)
end


get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num **2

  erb(:square_results)
end


get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = Math.sqrt(@the_num)

  erb(:square_root_results)
end



get("/payment/new") do
  erb(:new_payment)
end

get("/payment/results") do
  @the_apr = params.fetch("user_apr").to_f/100/12
  @the_years = params.fetch("user_years").strip.to_i
  @the_n = @the_years*12
  @the_pv = params.fetch("user_pv").to_f

  @the_result = (@the_apr*@the_pv)/(1-(1+@the_apr)**(-@the_n))

  erb(:payment_results)
end



get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @the_min = params.fetch("user_min").to_f
  @the_max = params.fetch("user_max").to_f
  @the_result = rand(@the_min..@the_max)

  erb(:random_results)
end
