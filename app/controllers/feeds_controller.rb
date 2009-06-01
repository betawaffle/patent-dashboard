require 'rss'
require 'open-uri'

class FeedsController < ApplicationController
  def show
    if url = params[:url]
      @feed = Feed.find_or_create_by_url(url)
      
      if name = params[:name]
        @feed.name = name
        @feed.save!
      end
    elsif name = params[:name]
      @feed = Feed.find_by_name(name)
    end
  end
end
