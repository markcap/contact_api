class PollsController < ApplicationController
  
  def create    
    Poll.create(email_address: params[:email],
                  city: params[:city],
                  phone: params[:phone],
                  name: params[:name],
                  display_name: params[:displayName],
                  state: params[:state],
                  question: params[:question],
                  consent: params[:consent]
                  )
  
    response = {:submitted => true}
    
    render :json => {code: 200, response: response}

  end
  
end