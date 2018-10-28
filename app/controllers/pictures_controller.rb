class PicturesController < ApplicationController
    def index
        @photos = Photo.all
        
        render("photos.html.erb")
    end
    def new_form
        render("photos_new.html.erb")
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

        render("photos_create.html.erb")
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
end