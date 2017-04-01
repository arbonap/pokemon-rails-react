class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :small_image_url
      t.string :large_image_url
      t.string :tagline
      t.string :web_url

      t.timestamps null: false
    end
  end
end
