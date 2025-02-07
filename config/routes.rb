Rails.application.routes.draw do
  resources :conversations, only: [:index, :create] do
  resources :messages, only: [:index, :new, :create]
  end

  get("/", {:controller => "application", :action=>"index"})
  
  get("/dashboard", { :controller => "dashboard", :action => "index" })


  # Routes for the Post resource:

  # CREATE
  post("/insert_post", { :controller => "posts", :action => "create" })

  # READ
  get("/create_posts", { :controller => "posts", :action => "index" })
  get("/posts", { :controller => "dashboard", :action => "index" })
  get("/posts/:path_id", { :controller => "posts", :action => "show" })

  # UPDATE

  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })

  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Routes for the User account:
  get("/profile", { :controller => "user_authentication", :action => "index" })
  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------

end
