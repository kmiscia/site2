class User < ActiveRecord::Base

  has_many :articles, :foreign_key => "posted_by"
  #has_many :comments

  validates_length_of :username, :within => 3..40
  validates_length_of :password, :within => 5..40
  validates_presence_of :username, :email, :encrypted_password
  validates_uniqueness_of :username, :email
  validates_confirmation_of :password
  validates_format_of :email, :with => /@/

  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
end
