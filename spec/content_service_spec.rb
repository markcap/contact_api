require 'spec_helper'

describe "content_service" do
  let(:content_service) { ContentService.new } 
  let(:features_response) {{
    "features": {
        "feature": [
                "short_name": "a-plus-advice-for-parents",
                "uexpress_subnavigation": "parenting",
                "active": "active",
                "website_activation_status": "active",
                "id": "1"]
            }
          }.to_h.deep_stringify_keys}
    
  describe "#get_endpoint" do
  
    it "should return json data for the endpoint" do
      expect(HTTParty).to receive(:get).with("", 
                                             {:headers=>{"Ocp-Apim-Subscription-Key"=> Rails.application.credentials.production_content_api_key}})
      content_service.get_endpoint("features", "website_id=uexpress")
    end
  
  end

  describe "#uexpress_category_hash" do
    it "Should return Uexpress categories" do
      allow(content_service).to receive(:get_endpoint).and_return(features_response)
      expect(content_service.uexpress_category_hash).to eq({"a-plus-advice-for-parents"=>"parenting"})
    end
  end
  
  describe "#get_feature_dates" do
    it "should return a calendar hash of calendar dates" do
      calendar_response = {"calendar": {"dates": ["1996-12-30","1996-12-31"]}}.to_h.deep_stringify_keys
      allow(content_service).to receive(:get_endpoint).and_return(calendar_response)
      expect(content_service.get_feature_dates([{"short_name" => "dearabby", "id" => "1"}])).to eq({"dearabby"=>["1996-12-30", "1996-12-31"]})
    end
  end
  
  describe "#get_active_feature_info" do
    it "should return an array of feature hashes" do
      allow(content_service).to receive(:get_endpoint).and_return(features_response)
      expect(content_service.get_active_feature_info("uexpress")).to eq([{"short_name" => "a-plus-advice-for-parents", "id" => "1"}])
    end
  end
  
end