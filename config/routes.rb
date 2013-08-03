Clover::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resource :contact_form, only: [ :create ]

  match "/dashboard",         to: "dashboard/sections#index",  as: :dashboard, via: :get
  match "/dashboard/profile", to: redirect("/users/edit"),     as: :user_root, via: :get

  namespace :dashboard do
    resources :users,     only: [ :index, :destroy ]
    resources :assets,    only: [ :create, :destroy ]
    resources :settings,  except: :show
    resources :sections,  except: :show
    resources :pages,     except: :show
  end

  match ":section/:page",             to: "pages#show", as: :section_page,    via: :get, format: :html
  match ":section/:subsection/:page", to: "pages#show", as: :subsection_page, via: :get, format: :html

  root to: "pages#home", via: :get
end
