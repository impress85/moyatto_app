class MoyattosController < ApplicationController
  before_action :authenticate_user!  , except: [:index,:show]
  before_action :set_moyatto, only: [:show,:edit,:update,:destroy]
  before_action :move_to_index, only: [:edit,:update]


  def index
    @moyattos = Moyatto.all.order(updated_at: "DESC")
  end

  def new
    @moyatto = Moyatto.new
  end

  def create
    @moyatto = Moyatto.new(moyatto_params)
  if @moyatto.save
    redirect_to root_path  
  else
    render  :new
  end

  end

  def show
    @guesses = @moyatto.guesses 
    @advices = @moyatto.advices
    @advice = Advice.new
  end

  def edit
  end

  def update
    if @moyatto.update(moyatto_params)
      redirect_to moyatto_path(@moyatto.id)
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && (current_user.id == @moyatto.user_id)
    @moyatto.destroy
    end
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
