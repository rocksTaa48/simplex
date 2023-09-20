Rails.application.routes.draw do
  devise_for(
    :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  )

  root('pages#index')

  resources(:items)

  resources(:categories)

  resources(:subcategories)
end
