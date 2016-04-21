class CreateAdminUsersSectionsJoin < ActiveRecord::Migration

  def up
    create_table :admin_users_sections, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "section_id"
    end
    add_index :admin_users_sections, ["admin_user_id", "section_id"]
  end

  def down
    drop_table :admin_users_sections
  end

end
