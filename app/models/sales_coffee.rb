class SalesCoffee < ApplicationRecord
       scope :twelve_months_ago, -> {where("date_time BETWEEN ? AND ?", 11.months.ago, Date.today) }
       scope :six_months_ago, ->{ where("date_time BETWEEN ? AND ?", 5.months.ago, Date.today) }
       scope :three_months_ago, -> { where("date_time BETWEEN ? AND ?", 2.months.ago, Date.today)  }
       scope :last_month_ago, -> {where("date_time BETWEEN ? AND ?", 30.days.ago, Date.today) }
end
