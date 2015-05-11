class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]

  # GET /annonces
  # GET /annonces.json
  def index
    @annonces = Annonce.all
  end

  # GET /annonces/1
  # GET /annonces/1.json
  def show
  end

  # GET /annonces/new
  def new
    @annonce = Annonce.new
  end

  # GET /annonces/1/edit
  def edit
  end

  def create
    @annonce = Annonce.new(annonce_params)
    if @annonce.save
      redirect_to @annonce, notice: 'Annonce créee.'
    else
      render action: 'new'
    end
  end

  def update
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def annonce_params
      params.require(:annonce).permit(:description)
    end
end
