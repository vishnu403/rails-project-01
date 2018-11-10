class User < ActiveRecord::Base
  validates :phone_no, presence: true,
                   length: {minimum: 10, maximum: 10}

end
