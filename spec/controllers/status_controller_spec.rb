require 'rails_helper'

RSpec.describe StatusController, type: :controller do

    describe "GET #index" do
        it "returns a success response" do
            get :index, params: {}
            expect(response).to be_successful
        end
    end
end