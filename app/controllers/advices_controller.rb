class AdvicesController < ApplicationController

  def create
    @advice = Advice.create(advice_params)
    redirect_to moyatto_path(params[:moyatto_id]) 
  end

  def destroy
    advice = Advice.find(params[:id])
    advice.destroy
    redirect_to moyatto_path(params[:moyatto_id]) 
  end

  private
  def advice_params
    params.require(:advice).permit(:comment).merge(user_id: current_user.id,moyatto_id: params[:moyatto_id])
  end



end
