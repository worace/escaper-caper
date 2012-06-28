class EscapePicker

  def escape_for(category)
    escapes = Escape.all.select do |e|
      e.primary_category == category
    end
    escapes.first
  end
end
