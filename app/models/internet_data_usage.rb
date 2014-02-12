class InternetDataUsage < ActiveRecord::Base

  validates :date_n_time, uniqueness: true

  def self.import(file)
    csv_data = CSV.read file
    headers = csv_data.shift.map {|i| i.to_s }
    string_data = csv_data.map {|row| row.map {|cell| cell.to_s } }
    internet_data_usage_array = string_data.map {|row| Hash[*headers.zip(row).flatten] }

    internet_data_usage_array.each do |internet_data_usage|
      (1..96).each do |cell|
        date_time_in_record = (DateTime.strptime(internet_data_usage['Date'], '%m/%d/%Y') + (cell * 15).minutes)
        time_header_selector = date_time_in_record.strftime('%H:%M')
        if '00:00' == time_header_selector
          time_header_selector = '24:00'
          date_time_in_record = (DateTime.strptime(internet_data_usage['Date'], '%m/%d/%Y') + ((cell * 15).minutes - 1.minutes))
        end
        # puts "date_time_in_record => #{date_time_in_record} ### Date => #{internet_data_usage['Date']} *** Time => #{time_header_selector} ~~~ Data => #{internet_data_usage[time_header_selector]}"
        InternetDataUsage.create(date_n_time: date_time_in_record, data: internet_data_usage[time_header_selector].to_f)
      end
    end
  end

  def self.usage_data
    # data = []
    # date_n_time = []
    # all_usage_data = InternetDataUsage.all
    # all_usage_data.each do |usage_data|
    #   data << usage_data.data
    #   date_n_time << usage_data.date_n_time.strftime('%Y-%m-%d %H:%M')
    # end
    # {data: data, date_n_time: date_n_time}
  end

  def self.daily_usage
    # SELECT sum(data) as usage, count(*) as records, date_trunc('day', date_n_time) AS day FROM "internet_data_usages" GROUP BY day
    usage_array = InternetDataUsage.select("sum(data) as usage, count(*) as records, date_trunc('day', date_n_time) AS day").group("day")
    usage_array.each {|al| puts "For #{al.day.year} #{Date::MONTHNAMES[al.day.month]} #{Date::DAYNAMES[al.day.day]} #{al.usage}" }
  end

  def self.peak_usage_entire_data
    
  end

  def self.total_weekly_usage
    
  end

  def self.total_monthly_usage
    dates = []
    usages = []
    # SELECT sum(data) as usage, count(*) as records, date_trunc('month', date_n_time) AS month FROM "internet_data_usages" GROUP BY month
    usage_array = InternetDataUsage.select("sum(data) as usage, count(*) as records, date_trunc('month', date_n_time) AS month").group("month")
    usage_array.each do |al| 
      dates << "#{al.month.year.to_s[2..3]} #{Date::MONTHNAMES[al.month.month][0..2]}"
      usages << al.usage
    end
    {dates: dates, usages: usages}
  end

  def self.data_usage_cost_per_day(unit_price)
    
  end

  def self.data_usage_cost_per_week(unit_price)
    
  end

  def self.data_usage_cost_per_month(unit_price)
    cost_per_month = []
    total_monthly_usage = InternetDataUsage.total_monthly_usage
    total_monthly_usage[:usages].each do |usage|
      cost_per_month << (usage * unit_price)
    end
    total_monthly_usage.merge!({costs: cost_per_month})
  end
end
