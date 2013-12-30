require 'spec_helper'

feature "Admin reviews inquiries", %q{
  As an admin
  I want to delete an inquiry
  So that I can remove spam or other undesirable inquiries
} do

  # Acceptance Criteria:
  # * I can see a list of all contact inquiries'

  context "admin deletes inquiry index" do

    it "inquiries should be deleted" do
      FactoryGirl.create(:inquiry)

      visit '/inquiries'

      click_on "Destroy"

      expect(page).to_not have_content("thisvalid@email.com")
    end
  end

end
