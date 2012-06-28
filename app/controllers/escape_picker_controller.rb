class EscapePickerController < ApplicationController
  def show
    @categories = ParentCategory.all
  end

  def create
    parent_category = ParentCategory.find(params[:category])
    escape = EscapePicker.new.escape_for(parent_category)
    redirect_to escape_path(escape)
  end
end
