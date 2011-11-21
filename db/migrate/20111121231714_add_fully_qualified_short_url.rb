class AddFullyQualifiedShortUrl < ActiveRecord::Migration
  def self.up
    add_column :short_urls, :short_full, :string
  end

  def self.down
    remove_column :short_urls, :short_full
  end
end
