class LettersController < ApplicationController
  
  def create    
    Letter.create(email_address: params[:email],
                  city: params[:city], 
                  country: params[:country], 
                  daytime_phone: params[:dayPhone], 
                  nighttime_phone: params[:eveningPhone], 
                  name: params[:fullName], 
                  street_address: params[:streetAddress], 
                  state: params[:state], 
                  zip_code: params[:zipCode],
                  message: params[:message]
                  )
  
    response = {:submitted => true}
    
    render :json => {code: 200, response: response}

  end
  
  def error_test
    1 / 0
    render :json => {code: 200}
  end
  
end