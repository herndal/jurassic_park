# == Schema Information
#
# Table name: cages
#
#  id         :bigint           not null, primary key
#  capacity   :integer          not null
#  is_active  :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cage < ApplicationRecord
  validates_presence_of :capacity

  has_many :dinosaurs

  def status
    is_active ? "ACTIVE" : "DOWN"
  end

  def size
    dinosaurs.count
  end

  def empty?
    size == 0
  end

  def full?
    size == capacity
  end

  def power_off
    if empty?
      self.is_active = false
      self.save
    else
      errors[:base] << "Cannot power off while containing dinosaurs"
    end
  end
end
