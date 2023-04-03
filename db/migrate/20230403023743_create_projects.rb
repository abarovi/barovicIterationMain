class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :Class_Type
      t.integer :Class_Number
      t.date :Class_Start
      t.date :Class_Finish
      t.text :Contact_Info

      t.timestamps
    end
  end
end
