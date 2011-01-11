module ApplicationHelper
  
  def title
    base_title = "Ruby Labs Home Page"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def banner
   image_tag("banner06.gif", :size => "950x188", :alt => "rubylabs") 
  end
  
  
end
