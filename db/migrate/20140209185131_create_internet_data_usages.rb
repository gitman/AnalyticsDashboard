class CreateInternetDataUsages < ActiveRecord::Migration
  def change
    create_table :internet_data_usages do |t|
      t.datetime :date_n_time
      t.float    :data

      t.timestamps
    end

    add_index :internet_data_usages, :date_n_time, :unique => true
  end
end
