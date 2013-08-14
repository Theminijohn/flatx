class AddPinterestLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pinterest_link, :string
  end
end
