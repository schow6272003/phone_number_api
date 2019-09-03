Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do 
        resources :phone_numbers do 
           collection do
             get :look_up
             get :all_phones_numbers
             post :assign
             post :delete
           end 
        end 
     end 
  end 


end
