class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :skills_id
      t.timestamps
    end

    create_table :ratings do |t|
      t.belongs_to :skill
      t.belongs_to :user
      t.integer :proficiency, :default => 0
    end
  end

end
