class ContentService
  
  def get_feature_item_url_hash
    get_feature_dates(get_active_feature_info("uexpress"))
  end
  
  def get_active_feature_info(website_id)
    features_info = []
    features = get_endpoint("features", "website_id=#{website_id}")["features"]["feature"]
    features.each do |feature_hash|
      if feature_hash["active"] == "active" && feature_hash["website_activation_status"] == "active"
        features_info << {"id" => feature_hash["id"], "short_name" => feature_hash["short_name"]}
      end
    end
    features_info
  end
  
  def get_feature_dates(feature_array)
    feature_date_hash = {}
    feature_array.each do |feature|
      feature_date_hash[feature["short_name"]] = get_endpoint("features/#{feature['id']}/assets/calendar.json")["calendar"]["dates"]
    end
    feature_date_hash
  end
  
  def uexpress_category_hash
    categories = {}
    features = get_endpoint("features.json", "website_id=uexpress")["features"]["feature"]
    features.each do |feature|
      categories[feature["short_name"]] = feature["uexpress_subnavigation"]&.downcase
    end
    categories
  end
  
  def get_endpoint(endpoint, params=nil)
    HTTParty.get("https://#{endpoint}?#{params}", :headers => {
      "Ocp-Apim-Subscription-Key" => Rails.application.credentials.production_content_api_key
    })
  end

end