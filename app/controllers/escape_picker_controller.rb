class EscapePickerController < ApplicationController
  def show
    @categories = Category.all
  end
end
