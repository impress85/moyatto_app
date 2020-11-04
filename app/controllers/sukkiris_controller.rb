class SukkirisController < ApplicationController


def new
  @moyatto = Moyatto.find(params[:moyatto_id])
  @guess = Guess.find(params[:guess_id])
  @sukkiri = Sukkiri.new
end

def create
  @sukkiri = Sukkiri.create(sukkiri_params)
end


  private
    def sukkiri_params
      params.require(:sukkiri).permit(:result,:moyatto_status)
      .merge(user_id: current_user.id,moyatto_id: params[:moyatto_id],guess_id: params[:guess_id])
    end


end
