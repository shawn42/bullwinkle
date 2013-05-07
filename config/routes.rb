Bullwinkle::Application.routes.draw do
  devise_for :users

  get "/long_term_planner" => "long_term_planner#index"
  get "/long_term_planner/next_year" => "long_term_planner#next_year"
  get "/long_term_planner/over_time" => "long_term_planner#over_time"

  root :to => 'long_term_planner#index'
end
