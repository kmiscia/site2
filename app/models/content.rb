class Content < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true
  validates :name_slug, :uniqueness => true

  before_destroy :validate_not_system

  private

  def validate_not_system
    !self.system
  end
end
