class ListingsController < ApplicationController
  before_action :require_login, except: :index
  
    def index
        @listings = Listing.all.reverse
    end

    def show 
      @listing = Listing.find(params[:id])
    rescue 
      redirect_to root_path
    end

    def new
        @listing = Listing.new
    end
    
    def create
      @listing = Listing.new(listing_params)
      @listing[:user_id] = current_user.id 
      
      respond_to do |format|
        if @listing.save
          format.html { redirect_to @listing, notice: "Listing was successfully created." }
          format.json { render :show, status: :created, location: @listing }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @listing.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @listing = Listing.find(params[:id])
    end

    def update
      @listing = Listing.find(params[:id])
  
      if @listing.update(listing_params)
        redirect_to @listing
      else
        render :edit
      end
    end

    def destroy
      @listing = Listing.find(params[:id])
      @listing.destroy
  
      redirect_to root_path
    end


  private
    def require_login
      unless authenticate_user!
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path
      end
    end

    def listing_params
      params.require(:listing).permit(:name, :price, :age, :description, :image)
    end

end
