class Cage < ApplicationRecord
  validates_presence_of :capacity
  validates_presence_of :is_active

  has_many :dinosaurs

  def size
    dinosaurs.count
  end

  def status
    is_active ? "ACTIVE" : "DOWN"
  end

  def power_off
    self.is_active = false
    self.save
  end
end
