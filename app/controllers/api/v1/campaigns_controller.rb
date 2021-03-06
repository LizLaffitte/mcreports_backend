
require 'MailchimpMarketing'
require 'byebug'
class Api::V1::CampaignsController < ApplicationController
    

    def index
        begin
            client = MailchimpMarketing::Client.new
            client.set_config({
                :api_key =>ENV['API_KEY'],
                :server =>  ENV['PREFIX']
            })
            response = client.reports.get_all_campaign_reports
            # Eventually save response to database instead of just serving it.
            # response["reports"].each |report| do
              
            # end
            render json: response["reports"]
          rescue MailchimpMarketing::ApiError => e
            puts "Error: #{e}"
          end

        campaigns = Campaign.all
    end

end
