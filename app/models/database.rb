class Database < ApplicationRecord
  require 'csv'

  scope :by_name, -> (value) { where("name ilike :value", { value: "%#{value}%"}) }
  scope :by_date, -> (value) { where("date::text ilike :value", { value: "%#{value}%"}) }
  scope :by_number, -> (value) { where("cast(number as text) ilike :value", { value: "#{value}"}) }
  scope :by_description, -> (value) { where("description ilike :value", { value: "%#{value}%"}) }

  scope :order_name, -> (direction) {
    if direction == 'asc'
      order(name: :asc)
    elsif direction == 'desc'
      order(name: :desc)
    end
  }

  scope :order_date, -> (direction) {
    if direction == 'asc'
      order(date: :asc)
    elsif direction == 'desc'
      order(date: :desc)
    end
  }

  scope :order_number, -> (direction) {
    if direction == 'asc'
      order(number: :asc)
    elsif direction == 'desc'
      order(number: :desc)
    end
  }

  scope :order_description, -> (direction) {
    if direction == 'asc'
      order(description: :asc)
    elsif direction == 'desc'
      order(description: :desc)
    end
  }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Database.create! row.to_hash
    end
  end

end
