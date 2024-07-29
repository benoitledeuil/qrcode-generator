Rails.application.routes.draw do
  root 'qrcodes#new'
  resources :qrcodes, only: [:create]
  get 'qrcode', to: 'qrcodes#show', as: 'qrcode'
end
