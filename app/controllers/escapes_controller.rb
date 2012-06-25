class EscapesController < ApplicationController
  def index
    @escapes = Escape.all
  end

  def show
    @escape = Escape.find_by_id(params[:id])
  end
end
