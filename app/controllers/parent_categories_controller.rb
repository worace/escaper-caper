class ParentCategoriesController < ApplicationController
  def index
    @categories = ParentCategory.all
  end

  def show
    parent_category = ParentCategory.find(params[:id])
    escape = EscapePicker.new.escape_for(parent_category)
    redirect_to escape_path(escape)
  end
end
