class User < ApplicationRecord
    def self.most_recent3
        User.last(limit = 3)
    end
    
end
