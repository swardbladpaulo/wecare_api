class User < ApplicationRecord
  enum role: %i[donor recipient]
end
