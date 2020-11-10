class GuessesController < ApplicationController
  before_action :authenticate_user! 
  before_action :authenticate_user! 
  before_action :set_moyatto, only: [:new,:create,:edit,:update]
  before_action :set_guess, only: [:edit,:update,:destroy]
  before_action :move_to_index, only: [:edit,:update]

  def new
    @guess = Guess.new
  end

  def create
    @guess = Guess.new(guess_params)
    if @guess.save
    redirect_to moyatto_path(params[:moyatto_id]) 
    else
    render :new
    end
  end

  def edit
  end

  def update
    if @guess.update(guess_params)
      redirect_to moyatto_path(params[:moyatto_id]) 
    else
      @guess = Guess.find(params[:id])
      render :edit
    end
  end

  def destroy
    if user_signed_in? && (current_user.id == @guess.user_id)
    @guess.destroy
    redirect_to moyatto_path(params[:moyatto_id]) 
    end
  end

  private
  def guess_params
    params.require(:guess).permit(:story).merge(user_id: current_user.id,moyatto_id: params[:moyatto_id])
  end

  def set_moyatto
    @moyatto = Moyatto.find(params[:moyatto_id])
  end

  def set_guess
    @guess = Guess.find(params[:id])
  end

  def move_to_index
    @moyatto = Moyatto.find(params[:moyatto_id])
    if current_user.id != @moyatto.user_id
      redirect_to root_path
    end
  end


end

