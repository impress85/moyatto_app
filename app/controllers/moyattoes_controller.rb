class MoyattoesController < ApplicationController
  def index
    @moyattoes = Moyatto.all
  end

  def new
    @moyatto = Moyatto.new
  end

end
