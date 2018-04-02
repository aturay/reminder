# == Schema Information
#
# Table name: notes
#
#  id             :integer          not null, primary key
#  text           :text
#  send_time      :datetime
#  interval_count :integer          default(1)
#  interval_type  :integer          default("hours")
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  next_time      :datetime
#

require 'rails_helper'

RSpec.describe Note, type: :model do
  pending "Start #{__FILE__}"
  let(:note) do
    Note.new(text: 'text', send_time: '2018-04-01T04:22:00+00:00', interval_count: 1, interval_type: "hours", user_id: 1)
  end

  describe 'set next time' do
    it 'get interval for 1 hours' do
      expect(note.interval.to_s).to eq('3600')
    end
  end
end
