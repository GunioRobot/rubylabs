module FlickrHelper
  
  def user_photos(user_id, photo_count = 5)
    flickr = Flickr.new(File.join(RAILS_ROOT, 'config', 'flickr.yml'))
    flickr.photos.search(:user_id => user_id).values_at(0..(photo_count-1))
  end
  
  def render_flickr_sidebar_widget(user_id, photo_count = 5, columns = 2)
    begin
      photos = user_photos(user_id, photo_count).in_groups_of(2)
      render :partial => '/flickr/photo', :local => { :photos => photos }
    rescue Exception 
      render :partial => '/flickr/unavailable'
    end
  end
end
