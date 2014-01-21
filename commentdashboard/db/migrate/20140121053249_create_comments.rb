class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :link
      t.string :commenter
      t.text :description
      t.datetime :opined_at
      t.references :blog, index: true

      t.timestamps
    end
  end
end
