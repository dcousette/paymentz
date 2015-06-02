class AddSlugs < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :payments, :slug, :string
    add_column :expenses, :slug, :string
  end
end
