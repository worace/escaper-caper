class EscapePicker

  def escape_for(category)
    escapes = Escape.all.select do |e|
      e.primary_category == category
    end
    if escapes.any?
      escapes.first
    else
      Escape.find(:first, :offset =>rand(Escape.count))
    end
  end
end
