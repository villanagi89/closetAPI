class CreateClosets < ActiveRecord::Migration
  def change
    create_table :closets do |t|
      t.string :name
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :closets, :users
  end
end
