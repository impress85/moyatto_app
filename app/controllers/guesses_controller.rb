class GuessesController < ApplicationController

  def new
    @moyatto = Moyatto.find(params[:moyatto_id])
    @guess = Guess.new
  end

  def create
    @guess = Guess.create(guess_params)
  end

  def edit
    @moyatto = Moyatto.find(params[:moyatto_id])
    @guess = Guess.find(params[:id])
  end

  def update
    @moyatto = Moyatto.find(params[:moyatto_id])
    # @guesses = @moyatto.guesses.includes(params[:id])
    @guess = Guess.find(params[:id])
    @guess.update(guess_params)
  end

  def destroy
    # moyatto = Moyatto.find(params[:id])
    guess = Guess.find(params[:id])
    guess.destroy
  end

  private
    def guess_params
      params.require(:guess).permit(:story).merge(user_id: current_user.id,moyatto_id: params[:moyatto_id])
        # ,id: params[:id])
    end

  end

