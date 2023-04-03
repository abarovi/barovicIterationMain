class Project < ApplicationRecord
    validates_presence_of :name, :Class_Type, :Class_Number, :Class_Start, :Class_Finish, :Contact_Info
end
