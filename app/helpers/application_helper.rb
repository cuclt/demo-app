module ApplicationHelper

  # Returns the full title on a per-page basics.
  def full_title(page_title = "")
    base_title = "Ruby on Rails Demo App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end