require 'spec_helper'

feature "User adds contact inquiry", %q{
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

      click_on 'New Inquiry'

      fill_in 'Email', with: 'email@address.com'
      fill_in 'Subject', with: 'Sexy'
      fill_in 'Description', with: 'Too sexy for my pants'
      fill_in 'First name', with: 'Maria'
      fill_in 'Last name', with: 'Nopants'

      click_on 'Create Inquiry'

      expect(page).to have_content('successfully created')
    end
  end

  context "users enter bad info like a bitch." do
    it "should return errors" do
      visit '/inquiries'

      click_on 'New Inquiry'

      click_on 'Create Inquiry'

      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("First name can't be blank")
      expect(page).to have_content("Last name can't be blank")
      expect(page).to have_content("Description can't be blank")
      expect(page).to have_content("Subject can't be blank")
      expect(page).to have_content("Email does not appear to be valid")
    end
  end

end
