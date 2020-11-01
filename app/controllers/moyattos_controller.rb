class MoyattosController < ApplicationController
  def index
    @moyattos = Moyatto.all
  end

  def new
    @moyatto = Moyatto.new
  end

  def create
    @moyatto = Moyatto.create(moyatto_params)
  end

  def show
    @moyatto = Moyatto.find(params[:id])
  end

  def edit
    @moyatto = Moyatto.find(params[:id])
  end

  def update
    @moyatto = Moyatto.find(params[:id])
    @moyatto.update(moyatto_params)
  end

  private
  def moyatto_params
    params.require(:moyatto).permit(:want, :cannot, :status, :image).merge(user_id: current_user.id)
  end

end
