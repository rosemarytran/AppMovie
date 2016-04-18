class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :ep_number
      t.string :ep_title
      t.string :ep_plot
      t.string :ep_time
      t.string :ep_date
      t.string :ep_broadcast

      t.timestamps null: false
    end
  end
end
