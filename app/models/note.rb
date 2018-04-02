# == Schema Information
#
# Table name: notes
#
#  id             :integer          not null, primary key
#  text           :text
#  send_time      :datetime
#  next_time      :datetime
#  interval_count :integer          default(1)
#  interval_type  :integer          default("hours")
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Note < ApplicationRecord
  belongs_to :user

  enum interval_type: [:hours, :day, :week, :month, :year]

  scope :ready_for_schedulеd, -> (time = DateTime.current){
    where(next_time: time..time + 1.hour)
  }

  def interval
    self.interval_count.send self.interval_type
  end

  def set_next_time
    self.update next_time: self.send_time + self.interval
  end

  def update_next_time
    self.update next_time: self.next_time + self.interval
  end
end
