class Content < ActiveRecord::Base

  validates_presence_of :name, :body
  validates_uniqueness_of :name
  validates_uniqueness_of :name_slug

  before_destroy :validate_not_system

  private

  def validate_not_system
    !self.system?
  end
end
