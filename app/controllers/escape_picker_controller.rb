class EscapePickerController < ApplicationController
  def show
    @categories = Category.all
  end

  def create
    category = Category.find(params[:category])
    escape = EscapePicker.new.escape_for(category)
    redirect_to escape_path(escape)
  end
end
