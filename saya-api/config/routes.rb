Rails.application.routes.draw do
  namespace :v1 do
    resource :counter 
  end
end
