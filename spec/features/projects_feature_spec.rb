require "rails_helper"

RSpec.feature "Projects", type: :feature do
    context "Update project" do
      let(:project) { Project.create(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me") }
      before(:each) do
        visit edit_project_path(project)
      end
      scenario "should be successful" do
        within("form") do
          fill_in "Name", with: "Barovic"
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
    end
    scenario "User creates a new project with valid attributes" do
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
        visit new_project_path
    
        click_button "Save to Database"
    
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Class type can't be blank")
        expect(page).to have_content("Class number can't be blank")
        expect(page).to have_content("Contact info can't be blank")
      end
end
