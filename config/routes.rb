Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do 
        resources :phone_numbers do 
           collection do
             get :all_phones_numbers
             post :assign
           end 
        end 
     end 
  end 


end
