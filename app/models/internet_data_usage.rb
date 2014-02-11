class InternetDataUsage < ActiveRecord::Base

  def self.import(file)
    csv_data = CSV.read file
    headers = csv_data.shift.map {|i| i.to_s }
    string_data = csv_data.map {|row| row.map {|cell| cell.to_s } }
    internet_data_usage_array = string_data.map {|row| Hash[*headers.zip(row).flatten] }

    internet_data_usage_array.each do |internet_data_usage|
      (0..96).each do |cell|
        date_time_in_record = (DateTime.strptime(internet_data_usage['Date'], '%m/%d/%Y') + (cell * 15).minutes)
        time_header_selector = date_time_in_record.strftime('%H:%M')
        if '00:00' == time_header_selector
          time_header_selector = '24:00'
        end
        # puts "date_time_in_record => #{date_time_in_record} ### Date => #{internet_data_usage['Date']} *** Time => #{time_header_selector} ~~~ Data => #{internet_data_usage[time_header_selector]}"
        InternetDataUsage.create(date_n_time: date_time_in_record, data: internet_data_usage[time_header_selector].to_f)
      end
    end
  end

  def self.usage_data
    data = []
    date_n_time = []
    all_usage_data = InternetDataUsage.all
    all_usage_data.each do |usage_data|
      data << usage_data.data
      date_n_time << usage_data.date_n_time.strftime('%Y-%m-%d %H:%M')
    end
    {data: data, date_n_time: date_n_time}
  end
end
