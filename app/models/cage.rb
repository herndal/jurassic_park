class Cage < ApplicationRecord
  validates_presence_of :capacity
  validates_presence_of :is_active

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

  def power_off
    if empty?
      self.is_active = false
      self.save
    else
      errors[:base] << "Cannot power off while containing dinosaurs"
    end
  end
end
