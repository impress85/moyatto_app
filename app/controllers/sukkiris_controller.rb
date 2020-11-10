class SukkirisController < ApplicationController
  before_action :authenticate_user! 

  def new
    @moyatto = Moyatto.find(params[:moyatto_id])
    @guess = Guess.find(params[:guess_id])
    @sukkiri = Sukkiri.new
  end

  def create
    @sukkiri = Sukkiri.new(sukkiri_params)
    if @sukkiri.save
      redirect_to moyatto_path(params[:moyatto_id]) 
    else
      @moyatto = Moyatto.find(params[:moyatto_id])
      @guess = Guess.find(params[:guess_id])
      render :new
    end
  end

  private
  def sukkiri_params
    params.require(:sukkiri).permit(:result,:moyatto_status).merge(user_id: current_user.id,moyatto_id: params[:moyatto_id],guess_id: params[:guess_id])
  end

end
