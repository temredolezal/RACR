class CreatePageEdits < ActiveRecord::Migration

  def up
    create_table :page_edits do |t|
      t.references :admin_user
      t.references :page
      t.string :summary
      t.timestamps
    end
    add_index :page_edits, ["admin_user_id", "page_id"]
  end

  def down
    drop_table :page_edits
  end

end
