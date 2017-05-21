class User < ActiveRecord::Base
    VALID_NUMBER_REGEX = /\d+/    
    validates :number, presence: true, length: { maximum: 11 },
                    format: { with: VALID_NUMBER_REGEX },
                    uniqueness: { case_sensitive: false }
                    
    has_secure_password
end