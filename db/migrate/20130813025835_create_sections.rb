class CreateSections < ActiveRecord::Migration

  def up
    create_table :sections do |t|
      t.integer "project_id"
      # same as: t.references :subject
      t.string "name"
      t.string "permalink"
      t.integer "position"
      t.boolean "visible", :default => false
      t.timestamps
    end
    add_index("sections", "project_id")
    add_index("sections", "permalink")
  end

  def down
    drop_table :sections
  end

end
