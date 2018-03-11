Rails.application.routes.draw do
  namespace :api, constraints: { format: "json" } do
    namespace :v1 do
      post "/webhook", to: "bots#webhook"
    end
  end
end
