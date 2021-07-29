class AddPlatformToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :platform, :string
  end
end
