class User < ActiveRecord::Base
    VALID_NUMBER_REGEX = /\d+/    
    validates :number, presence: true, length: { is: 11 },
                    format: { with: VALID_NUMBER_REGEX },
                    uniqueness: { case_sensitive: false }
                    
    validates :password, presence: true, length: { is: 6 },
                    format: { with: VALID_NUMBER_REGEX },
                    uniqueness: { case_sensitive: false }
                    
    has_secure_password
    
    has_many :saves, class_name: "Save"
    has_many :spends
end


# knives  -> knife
# saves  -> safe