require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :user_name, String, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :email
  validates_presence_of :user_name


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
