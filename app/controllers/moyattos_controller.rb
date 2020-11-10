class MoyattosController < ApplicationController
  before_action :authenticate_user!  , except: [:index,:show]
  # before_action :set_moyatto, only: []
  before_action :move_to_index, only: [:edit,:update]


  def index
    @moyattos = Moyatto.all.order(updated_at: "DESC")
  end

  def new
    @moyatto = Moyatto.new
  end

  def create
    @moyatto = Moyatto.create(moyatto_params)
    redirect_to root_path
  end

  def show
    @moyatto = Moyatto.find(params[:id])
    @guesses = @moyatto.guesses 
    @advices = @moyatto.advices
    @advice = Advice.new
  end

  def edit
    @moyatto = Moyatto.find(params[:id])
  end

  def update
    @moyatto = Moyatto.find(params[:id])
    @moyatto.update(moyatto_params)
    redirect_to moyatto_path(@moyatto.id)
  end

  def destroy
    moyatto = Moyatto.find(params[:id])
    moyatto.destroy
    redirect_to root_path
  end

  private
  def moyatto_params
    params.require(:moyatto).permit(:want, :cannot, :status, :image).merge(user_id: current_user.id)
  end

  def set_moyatto
    @moyatto = Moyatto.find(params[:id])
  end

  def move_to_index
    @moyatto = Moyatto.find(params[:id])
    if current_user.id != @moyatto.user_id
      redirect_to root_path
    end
  end

end
