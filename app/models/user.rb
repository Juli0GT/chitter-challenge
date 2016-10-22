class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String

  @count = 0

  def user_count
    @count +=1
  end



end
