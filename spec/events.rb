require 'rails_helper'

describe "Open events page", type: :system do 
  context "go to the events page" do
    it "opens the events page" do
      visit '/events'

      expect(page).to have_content('Our Best Events')

      expect(page).to have_content('Location:')
    end
  end
end