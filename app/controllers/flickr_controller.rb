class FlickrController < ApplicationController

  def search
    flickr = Flickr.new 'd634119160e34a259f581247004c671c'
    render :partial => "photo", :collection => flickr.photos(:tags => params[:tag], :per_page => '24') 
  end
end
