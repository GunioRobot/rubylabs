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
   image_tag("banner06.gif", :size => "950x180", :alt => "rubylabs") 
  end
  
  def coderay(text)
    text.gsub(/<code( lang="(.+?)")?>(.+?)<\/code>/m) do
      CodeRay.scan($3, $2).div(:css => :class)
    end
  end
  
end
