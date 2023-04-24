require "rails_helper"

RSpec.feature "HomePages", type: :feature do
    scenario "The visitor should see projects" do
      visit root_path
      expect(page).to have_text("Add New Contact Info")
      expect(page).to have_text("Contact Info")
    end
  end
  