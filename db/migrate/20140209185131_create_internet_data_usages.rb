class CreateInternetDataUsages < ActiveRecord::Migration
  def change
    create_table :internet_data_usages do |t|
      t.datetime :date_n_time
      t.float    :data

      t.timestamps
    end
  end
end
