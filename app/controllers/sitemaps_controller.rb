class SitemapsController < ApplicationController
  
  def index    
    render :xml => File.open("public/sitemap.xml")
  end
  
end