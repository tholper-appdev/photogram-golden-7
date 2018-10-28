Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get("/",                        { :controller => "pictures", :action => "index" })
  
  get("/photos/new",              { :controller => "pictures", :action => "new_form" })
  get("/create_photo",            { :controller => "pictures", :action => "create_row" })
  
  # READ
  get("/photos",                  { :controller => "pictures", :action => "index" })
  get("/photos/:id",              { :controller => "pictures", :action => "show" })
  
  # UPDATE
  get("/photos/:id/edit",         { :controller => "pictures", :action => "edit_form" })
  get("/update_photo/:id",        { :controller => "pictures", :action => "update_row" })
  
  # DELETE
  get("/delete_photo/:id",        { :controller => "pictures", :action => "destroy_row" })
    
end
