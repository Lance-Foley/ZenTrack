class Client < ApplicationRecord
  has_many :projects

  validates :first_name, presence: true
  validates :last_name, presence: true


  def self.options_for_select
    where(active: true).order('last_name').map { |e| [e.last_name, e.id] }
  end

  def self.active
    where(active: true)
  end

  def name
    [first_name, last_name].join(' ')
  end
end
