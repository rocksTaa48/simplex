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

  get('cart', to: 'cart#show')
  post('cart/add')
  post('cart/remove')

  resources(:orders, only: %i[destroy]) do
    collection do
      post(:checked)
    end
  end
end
