require 'rails_helper'
require 'vcr'

describe "Open events page", type: :feature do 
  VCR.use_cassette('caredotcom_api') do
    context "go to the events page" do
      it "opens the events page" do
        visit '/'

        expect(page).to have_content('Our Best Events')

        expect(page).to have_content('Location:')
      end
    end
  end
end