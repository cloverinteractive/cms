class RemoveUrlNameFromPages < ActiveRecord::Migration
  def up
    remove_column :pages, :url_name
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't undo this migration"
  end
end
