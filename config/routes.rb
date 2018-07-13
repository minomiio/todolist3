Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos do
  # patch "/todos/:id/is_done", to: "todos#done"
    member do
      patch :is_done
    end
  end
  root "todos#index"
end


# 以下的寫法除了為:todos建出基本的7個CRUD動作之外，可以為:is_done做出包含prefix在內都有子母關係的路由
  # method 1:
  # ---------------------------------------------------------------------------------------
  # Prefix       Verb   URI Pattern                  Controller#Action
  # is_done_todo PATCH  /todos/:id/is_done(.:format) todos#is_done
  #        todos GET    /todos(.:format)             todos#index
  #              POST   /todos(.:format)             todos#create
  #     new_todo GET    /todos/new(.:format)         todos#new
  #    edit_todo GET    /todos/:id/edit(.:format)    todos#edit
  #         todo GET    /todos/:id(.:format)         todos#show
  #              PATCH  /todos/:id(.:format)         todos#update
  #              PUT    /todos/:id(.:format)         todos#update
  #              DELETE /todos/:id(.:format)         todos#destroy
  # ---------------------------------------------------------------------------------------
  # resources :todos do
  #   member do
  #     patch :is_done
  #   end
  # end

  # method 2:
  # ---------------------------------------------------------------------------------------
  # Prefix    Verb   URI Pattern                  Controller#Action
  # todos     GET    /todos(.:format)             todos#index
  #           POST   /todos(.:format)             todos#create
  # new_todo  GET    /todos/new(.:format)         todos#new
  # edit_todo GET    /todos/:id/edit(.:format)    todos#edit
  # todo      GET    /todos/:id(.:format)         todos#show
  #           PATCH  /todos/:id(.:format)         todos#update
  #           PUT    /todos/:id(.:format)         todos#update
  #           DELETE /todos/:id(.:format)         todos#destroy
  #           PATCH  /todos/:id/is_done(.:format) todos#done
  # ---------------------------------------------------------------------------------------
  # resources :todos
  # patch "/todos/:id/is_done", to: "todos#done"