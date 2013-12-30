require 'spec_helper'

describe Inquiry do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :description }
  it { should validate_presence_of :email }

  it { should have_valid(:email).when("email@mail.com","mail@test.com","people@place.org") }
  it { should_not have_valid(:email).when("emailmail.com","mail@testcom","people@place") }
end
