Taller::Application.routes.draw do
  
  get "main/index"

  match 'nuevacita/:placa/:fecha/:hora' => 'main#create_cita'
  match 'consultarfechahora/:fecha/:hora(.:format)' => 'main#find_cita'
  match 'consultarfecha/:fecha(.:format)' => 'main#find_cita'

  match 'recibirvehiculo/:cita_id(.:format)' => 'main#create_orden'
  match 'agregarservicio/:orden_id/:servicio_id(.:format)' => 'main#create_servicio'

  match 'servicio_nombre/:servicio_id(.:format)' => 'testdata#servicio_nombre'
  match 'consultarestado/:order_id(.:format)' => 'main#consultar_estado'
  match 'consultarrepuestos/:descripcion(.format)' => 'main#consultar_repuestos'
  match 'devolucionvehiculo/:orden_id(.format)' => 'main#devolucion_vehiculo'
  match 'descargo1/:orden_id/servi_id(.format)' => 'main#descargo1'
  match 'solicitudordenrepuestos/:orden_id/:servi_id(.format)' => 'main#solicitudordenrepuestos'


  match 'actualizarorden' => 'main#actualizar_orden'
  match 'modificarorden/:orden_id' => 'main#orden_edit', :as => 'modificarorden'
  match 'agregarrepuesto/:orden_id/:orden_detalle_id' => 'main#orden_add', :as => 'agregarrepuesto'

  resources :serviciorepuestos

  resources :ordendetalles

  resources :estados

  resources :ordenes

  resources :citas

  resources :vehiculos



  #resources :vehiculos

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
