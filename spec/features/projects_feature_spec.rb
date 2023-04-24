require "rails_helper"

RSpec.feature "Projects", type: :feature do
  context "Login" do
    scenario "should sign up" do
      visit root_path
      click_link 'Sign up'
      within("form") do
        fill_in "Email", with: "testing@test.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Sign up"
      end
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end


    scenario "should log in" do
      user = FactoryBot.create(:user)
      login_as(user)
      visit root_path
      expect(page).to have_content("Logged in")
    end
    
  end

    context "Update project" do
      let(:project) { Project.create(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit edit_project_path(project)
      end
      scenario "should be successful" do
        within("form") do
          fill_in "Name", with: "Barovic"
        end
        click_button "Save to Database"
        expect(page).to have_content("Project was successfully updated")
      end
      scenario "should be successful" do
        within("form") do
          fill_in "Name", with: "Barovic"
          fill_in "Class Type", with: "BAR"
          fill_in "Class Number", with: 12345
        end
        click_button "Save to Database"
        expect(page).to have_content("Project was successfully updated")
      end
      scenario "should fail" do
        within("form") do
          fill_in "Name", with: ""
        end
        click_button "Save to Database"
        expect(page).to have_content("Name can't be blank")
      end
      scenario "should fail" do
        within("form") do
          fill_in "Class Type", with: ""
        end
        click_button "Save to Database"
        expect(page).to have_content("Class type can't be blank")
      end
      scenario "should fail" do
        within("form") do
          fill_in "Class Number", with: ""
        end
        click_button "Save to Database"
        expect(page).to have_content("Class number can't be blank")
      end
      scenario "should fail" do
        within("form") do
          fill_in "Contact Info", with: ""
        end
        click_button "Save to Database"
        expect(page).to have_content("Contact info can't be blank")
      end
    end
    
    scenario "User creates a new project with valid attributes" do
      user = FactoryBot.create(:user)
      login_as(user)

        visit new_project_path
    
        fill_in "Name", with: "Test Student"
        fill_in "Class Type", with: "VVV"
        fill_in "Class Number", with: 101
        fill_in "Contact Info", with: "Contact Me!"
    
        click_button "Save to Database"
    
        expect(page).to have_content("Project was successfully created.")
        expect(page).to have_content("Test Student")
        expect(page).to have_content("VVV")
        expect(page).to have_content("101")
        expect(page).to have_content("Contact Me!")
      end
      scenario "User attempts to create a new project with invalid attributes" do
        user = FactoryBot.create(:user)
        login_as(user)

        visit new_project_path
    
        click_button "Save to Database"
    
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Class type can't be blank")
        expect(page).to have_content("Class number can't be blank")
        expect(page).to have_content("Contact info can't be blank")
      end
      
end
