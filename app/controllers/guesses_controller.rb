class GuessesController < ApplicationController

  def new
    @moyatto = Moyatto.find(params[:moyatto_id])
    @guess = Guess.new
  end

  def create
    @guess = Guess.create(guess_params)
  end

  # エラーになる Couldn't find Moyatto with 'id'=moyatto_id
  def edit
    # binding.pry
   @moyatto = Moyatto.find(params[:moyatto_id])
    @guess = Guess.find(params[:id])
  end
  # エラーになる Couldn't find Moyatto with 'id'=moyatto_id
  def update
    @moyatto = Moyatto.find(params[:moyatto_id])
    # @guesses = @moyatto.guesses.includes(params[:id])
    # @guess = @guesses.update(guess_params)
    @guess = Guess.find(params[:id])
    @guess.update(guess_params)
  end

  private
    def guess_params
      params.require(:guess).permit(:story).merge(user_id: current_user.id,moyatto_id: params[:moyatto_id],id: params[:id])
    end

    def guess_update_params
      params.require(:guess).permit(:story).merge(user_id: current_user.id,moyatto_id: params[:moyatto_id])
    end

  end

