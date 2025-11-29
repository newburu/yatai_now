Rails.application.routes.draw do
  get "sender/index"
  get "map", to: "map#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # 1. 参照者（一般観覧客）向け
  # トップページ（地図）
  root "map#index"

  # 2. GPS送信担当者向け
  # 合言葉入力ページと、位置情報を「送る」ためのエンドポイント
  get "sender", to: "sender#index"
  namespace :api do
    namespace :v1 do
      resources :locations, only: [ :create ] # スマホからのGPS情報をここで受け取る
      get "map_data", to: "map_data#index"  # 地図に表示するデータをここで返す
    end
  end

  # 3. 管理者向け
  # Deviseのログイン機能
  devise_for :users

  # サイト管理者用 ( /admin/festivals など)
  namespace :admin do
    resources :stalls
    resources :users
    resources :festivals
    resources :users # 屋台管理者アカウントの管理
  end

  # 屋台管理者用 ( /manager/my_stall など)
  namespace :manager do
    get "stalls/show"
    get "stalls/edit"
    get "stalls/update"
    resource :stall, only: [ :show, :edit, :update ] # 自分の屋台を管理
  end
end
