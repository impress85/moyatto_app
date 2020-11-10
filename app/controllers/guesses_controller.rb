class GuessesController < ApplicationController

  before_action :authenticate_user! 
  # before_action :set_moyatto, only: []
  before_action :move_to_index, only: [:edit,:update]

  def new
    @moyatto = Moyatto.find(params[:moyatto_id])
    @guess = Guess.new
  end

  def create
    @guess = Guess.create(guess_params)
    redirect_to moyatto_path(params[:moyatto_id]) 
  end

  def edit
    @moyatto = Moyatto.find(params[:moyatto_id])
    @guess = Guess.find(params[:id])
  end

  def update
    @moyatto = Moyatto.find(params[:moyatto_id])
    @guess = Guess.find(params[:id])
    @guess.update(guess_params)
    redirect_to moyatto_path(params[:moyatto_id]) 
  end

  def destroy
    guess = Guess.find(params[:id])
    guess.destroy
    redirect_to moyatto_path(params[:moyatto_id]) 
  end

  private
  def guess_params
    params.require(:guess).permit(:story).merge(user_id: current_user.id,moyatto_id: params[:moyatto_id])
  end

  def move_to_index
    @moyatto = Moyatto.find(params[:moyatto_id])
    if current_user.id != @moyatto.user_id
      redirect_to root_path
    end
  end


end

