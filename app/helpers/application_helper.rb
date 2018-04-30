module ApplicationHelper
  def sort_direction(value)
    if value.nil? || value == 'desc'
      "asc"
    else
      "desc"
    end
  end
end
