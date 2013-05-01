class User < ActiveRecord::Base
  attr_accessible :password, :username

  def self.authenticate username, password
    where(:username => username, :password => password).first
  end
end
