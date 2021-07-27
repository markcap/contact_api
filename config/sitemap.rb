require "content_service"

SitemapGenerator::Sitemap.default_host, uexpress_url = ""
# SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  main_priority = nil
  info_priority = nil
  
  #get all the feature urls and their articles. 
  content_service = ContentService.new
  category_hash = content_service.uexpress_category_hash
  content_service.get_feature_item_url_hash.each_pair do |short_name, dates|
    category = category_hash[short_name]
    add "/#{category}/#{short_name}/", priority: main_priority, changefreq: nil
    add "/#{category}/#{short_name}/about", priority: main_priority, changefreq: nil
    add "/#{category}/#{short_name}/archives", priority: main_priority, changefreq: nil
    dates.each do |date|
      unless Date.parse(date) > Date.today
        add "/#{category}/#{short_name}/#{date.gsub('-', '/')}", priority: main_priority, changefreq: nil
      end
    end
  end
  
  add "/life", priority: main_priority, changefreq: nil
  add "/parenting", priority: main_priority, changefreq: nil
  add "/home", priority: main_priority, changefreq: nil
  add "/pets", priority: main_priority, changefreq: nil
  add "/health", priority: main_priority, changefreq: nil
  add "/astrology", priority: main_priority, changefreq: nil
  add "/oddities", priority: main_priority, changefreq: nil
  
  add "/life/dearabby/polls", priority: main_priority, changefreq: nil
  add "/life/dearabby/contact", priority: main_priority, changefreq: nil
  
  add "/about", priority: info_priority, changefreq: nil
  add "/contact", priority: info_priority, changefreq: nil
  add "/submissions", priority: info_priority, changefreq: nil
  add "/search", priority: info_priority, changefreq: nil
end