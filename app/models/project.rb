class Project < ApplicationRecord
    validates_presence_of :name, :Class_Type, :Class_Number, :Class_Start, :Class_Finish, :Contact_Info
    def self.search(search)
        if search
          where('name LIKE ?', "%#{search}%")
        else
          all
        end
    end
end
