class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :zipcode
      t.string :gender
      t.string :lookingfor
      t.integer :age
      t.string :height
      t.string :status
      t.string :occupation
      t.string :bodytype
      t.string :haircolor

      t.timestamps
    end
  end
end
