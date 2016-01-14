Rails.application.routes.draw do
  get'/stuff' => 'products#item_display'
end
