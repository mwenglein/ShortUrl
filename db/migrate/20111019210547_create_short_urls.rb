class CreateShortUrls < ActiveRecord::Migration
  def self.up
    create_table :short_urls do |t|
      t.string :long
      t.string :short
      t.integer :visits
      t.datetime :lastvisit

      t.timestamps
    end
  end

  def self.down
    drop_table :short_urls
  end
end
