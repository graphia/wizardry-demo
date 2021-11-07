Rails.application.routes.draw do
  resource "hello", only: :show

  root to: "hello#show"

  get   %(order/:page), to: %(orders#edit),   as: :orders_edit
  patch %(order/:page), to: %(orders#update), as: :orders_update
end
