require "rails_helper"

describe "Project Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the name is present when creating project" do
      project = Project.new(Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me")
      expect(project.valid?).to eq(false)
    end
    it "ensures the Class_Type is present when creating project" do
        project = Project.new(name: "Andrew", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me")
        expect(project.valid?).to eq(false)
    end
    it "ensures the Class_Number is present when creating project" do
        project = Project.new(name: "Andrew", Class_Type: "CS", Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me")
        expect(project.valid?).to eq(false)
    end
    it "ensures the Class_Start is present when creating project" do
        project = Project.new(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Finish: Date.today, Contact_Info: "Contact Me")
        expect(project.valid?).to eq(false)
    end
    it "ensures the Class_Finish is present when creating project" do
        project = Project.new(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Contact_Info: "Contact Me")
        expect(project.valid?).to eq(false)
    end
    it "ensures the Contact_Info is present when creating project" do
        project = Project.new(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today)
        expect(project.valid?).to eq(false)
    end
    it "should not be able to save project when name missing" do
        project = Project.new(Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me")
        expect(project.save).to eq(false)
    end
    it "should not be able to save project when Class_Type missing" do
        project = Project.new(name: "Andrew", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me")
        expect(project.save).to eq(false)
    end
    it "should not be able to save project when Class_Number missing" do
        project = Project.new(name: "Andrew", Class_Type: "CS", Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me")
        expect(project.save).to eq(false)
    end
    it "should not be able to save project when Class_Start missing" do
        project = Project.new(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Finish: Date.today, Contact_Info: "Contact Me")
        expect(project.save).to eq(false)
    end
    it "should not be able to save project when Class_Finish missing" do
        project = Project.new(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Contact_Info: "Contact Me")
        expect(project.save).to eq(false)
    end
    it "should not be able to save project when Contact_Info missing" do
        project = Project.new(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today)
        expect(project.save).to eq(false)
    end
    it "should be able to save project when have name, Class_Type, Class_Number, Class_Start, Class_Finish, Contact_Info" do
        project = Project.new(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me")
      expect(project.save).to eq(true)
    end
  end
end

describe "Project Attribute Requirements on Edit", :type => :model do
  context "Edit project" do  
    before (:each) do
      @project = Project.create(name: "Andrew", Class_Type: "CS", Class_Number: 1234, Class_Start: Date.today, Class_Finish: Date.today, Contact_Info: "Contact Me")
 
    end
    it "ensures the name is present when editing project" do
      @project.update(:name => "Barovic")
      expect(@project.name == "Barovic")
    end
    it "ensures the Class_Type is present when editing project" do
        @project.update(:Class_Type => "ECE")
        expect(@project.Class_Type == "ECE")
    end
    it "ensures the Class_Number is present when editing project" do
        @project.update(:Class_Number => 1111)
        expect(@project.Class_Number == 1111)
    end
    it "ensures the Class_Start is present when editing project" do
        @project.update(:Class_Start => Date.today + 1.week)
        expect(@project.Class_Start == Date.today + 1.week)
    end
    it "ensures the Class_Finish is present when editing project" do
        @project.update(:Class_Finish => Date.today + 1.week)
        expect(@project.Class_Finish == Date.today + 1.week)
    end
    it "ensures the Contact_Info is present when editing project" do
        @project.update(:Contact_Info => Date.today + 1.week)
        expect(@project.Contact_Info == Date.today + 1.week)
    end
  end
end
