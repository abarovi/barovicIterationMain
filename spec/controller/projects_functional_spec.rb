require "rails_helper"

RSpec.describe ProjectsController, :type => :controller do
    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
                get :index
                expect(response).to have_http_status(:ok)
            end
        end

        context "GET #show" do
            let!(:project) { Project.create(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        context "GET #new" do
            it "returns a success response" do
                get :new
                expect(response).to have_http_status(:ok)
            end
        end
        context "GET #edit" do
            it "loads edit template" do
                project = Project.create(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me")
                get :edit, params: { id: project.id }
                expect(response).to have_http_status(:ok)
            end
        end
        
    end
    
end
