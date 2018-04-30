class Database < ApplicationRecord
  require 'csv'

  scope :by_name, -> (value) { where("name ilike :value", { value: "%#{value}%"}) }
  scope :by_date, -> (value) { where("date::text ilike :value", { value: "%#{value}%"}) }
  scope :by_number, -> (value) { where("cast(number as text) ilike :value", { value: "#{value}"}) }
  scope :by_description, -> (value) { where("description ilike :value", { value: "%#{value}%"}) }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Database.create! row.to_hash
    end
  end

end
