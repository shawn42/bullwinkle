Bullwinkle::Application.routes.draw do
  get "/long_term_planner" => "long_term_planner#index"
  get "/long_term_planner/next_year" => "long_term_planner#next_year"
end
