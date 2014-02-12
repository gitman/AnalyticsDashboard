require 'spec_helper'

describe InternetDataUsage do
  it { should respond_to(:date_n_time)}
  it { should respond_to(:data)}

  it { should validate_uniqueness_of(:date_n_time) }

  it 'total_monthly_usage returns monthly usage data' do
    time_now = Time.now
    InternetDataUsage.make!(date_n_time: time_now, data: 20.1)
    InternetDataUsage.make!(date_n_time: time_now + 15.minutes, data: 24.5)
    InternetDataUsage.total_monthly_usage.should == {:dates => ["#{time_now.year.to_s[2..3]} #{Date::MONTHNAMES[time_now.month][0..2]}"], :usages => [44.6]}
  end
end
