require 'spec_helper'

feature "Registered user logs in", %q{
  As a site visitor
  I want to contact the site's staff
  So that I can tell them how awesome they are
} do

  # Acceptance Criteria:
  # * I must specify a valid email address
  # * I must specify a subject
  # * I must specify a description
  # * I must specify a first name
  # * I must specify a last name

  context "user enters valid information" do
    it "should save the contact inquiry" do
      visit '/inquiries'

      click_on 'New inquiry'

      fill_in 'Email address', with: 'email@address.com'
      fill_in 'Subject', with: 'Sexy'
      fill_in 'Description', with: 'Too sexy for my pants'
      fill_in 'First name', with: 'Maria'
      fill_in 'Last name', with: 'Nopants'

      click_on 'Save inquiry'

      expect(page).to have_content('successfully saved')
    end
  end

end
