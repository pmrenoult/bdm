class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]


  # GET /annonces
  # GET /annonces.json
  def index
  #@annonces = Annonce.all

    if params[:search]
      @annonces = Annonce.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
      @hash = Gmaps4rails.build_markers(@annonces) do |annonce, marker|
        marker.lat annonce.latitude
        marker.lng annonce.longitude
        marker.title annonce.name
      end
    else
      @annonces = Annonce.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
      @hash = Gmaps4rails.build_markers(@annonces) do |annonce, marker|
        marker.lat annonce.latitude
        marker.lng annonce.longitude
        marker.title annonce.name
      end
    end
  end




  # GET /annonces/1
  # GET /annonces/1.json
  def show
  end

  # GET /annonces/new
  def new
    @annonce = current_user.annonces.build
    @categories = Category.all.map{|c| [ c.name, c.id ] }

  end

  # GET /annonces/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @annonce = current_user.annonces.build(annonce_params)
    @annonce.category_id = params[:category_id]
    if @annonce.save
      redirect_to @annonce, notice: 'Annonce créee.'
    else
      render action: 'new'
    end
  end

  def update
    @annonce.category_id = params[:category_id]
    if @annonce.update(annonce_params)
      redirect_to @annonce, notice: 'Annonce modifiée.'
    else
      render action: 'edit'
    end
  end

def destroy
    @annonce.destroy
    redirect_to annonces_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annonce
      @annonce = Annonce.find(params[:id])
    end

    def correct_user
      @annonce = current_user.annonces.find_by(id: params[:id])
      redirect_to annonces_path, notice: "Not authorized to edit this annonce" if @annonce.nil?

    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def annonce_params
      params.require(:annonce).permit(:description, :name, :image, :address, :latitude, :longitude, :category_id)
    end
end
