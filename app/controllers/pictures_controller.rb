class PicturesController < ApplicationController
    def index
        @photos = Photo.all
        
        render("photos.html.erb")
    end
    def new_form
        render("photos_create_form.html.erb")
    end
    def create_row
        if params.fetch("the_source")
            @source = params.fetch("the_source")
        else
            @source = ""
        end
        if params.fetch("the_caption")
            @caption = params.fetch("the_caption")
        else
            @caption = ""
        end        
        photo = Photo.new
        photo.source = @source
        photo.caption = @caption
        photo.save

        render("photos_create_action.html.erb")
    end  
    def destroy_row
        if params.fetch("id")
            @id = params.fetch("id")
        else
            @id = ""
        end 
        
        photo = Photo.find(@id)
        photo.destroy
        
        render("photos_delete.html.erb")
    end
    def edit_form
        if params.fetch("id")
            @id = params.fetch("id")
        else
            @id = ""
        end 
        
        photo = Photo.find(@id)
        @source = photo.source
        @caption = photo.caption         
        
        render("photos_update_form.html.erb")
    end
    def update_row
        if params.fetch("id")
            @id = params.fetch("id")
        else
            @id = ""
        end 
        if params.fetch("the_source")
            @source = params.fetch("the_source")
        else
            @source = ""
        end
        if params.fetch("the_caption")
            @caption = params.fetch("the_caption")
        else
            @caption = ""
        end        
        
        photo = Photo.find(@id)
        photo.source = @source
        photo.caption = @caption
        photo.save

        render("photos_update_action.html.erb")
    end 
    def show
        if params.fetch("id")
            @id = params.fetch("id")
        else
            @id = ""
        end 
        
        photo = Photo.find(@id)
        @source = photo.source
        @caption = photo.caption

        @created_at = photo.created_at
        @minutes_ago = (Time.current - @created_at).minutes.round
        
        render("photos_detail.html.erb")
    end  
end