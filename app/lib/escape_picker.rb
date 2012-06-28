class EscapePicker

  def escape_for(parent_cat)
    escapes = Escape.all.select do |e|
      e.primary_category == parent_cat
    end
    if escapes.any?
      escapes[rand(escapes.count)]
    else
      Escape.find(:first, :offset =>rand(Escape.count))
    end
  end
end
