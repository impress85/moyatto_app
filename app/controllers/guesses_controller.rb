class GuessesController < ApplicationController

  def index
   @guesses = Guess.all
  end

  def new
    @moyatto = Moyatto.find(params[:moyatto_id])
    @guess = Guess.new
  end

  def create
    @guess = Guess.create(guess_params)
  end

  def show
  end

  private
  def guess_params
    params.require(:guess).permit(:story).merge(user_id: current_user.id,moyatto_id: params[:moyatto_id])
  end

end
