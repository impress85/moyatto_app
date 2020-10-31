class FogsController < ApplicationController
  def index
    @fogs = Fog.all
  end
end
