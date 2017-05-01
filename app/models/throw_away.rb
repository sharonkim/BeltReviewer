class ThrowAway < ApplicationRecord
    validates_date :date, :on_or_after => :today, notice: "Please enter a valid date"
end
