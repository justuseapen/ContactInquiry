require 'spec_helper'

feature "Admin reviews inquiries", %q{
  As an admin
  I want to review contact inquiries
  So that I can respond or take action
  } do

  # *I can see a list of all contact inquiries'

  context "admin views inquires index" do

    it "inquiries should be displayed" do

      FactoryGirl.create(:inquiry)
      visit '/inquiries'

      expect(page).to have_content('thisvalid@email.com')
    end
  end

end
