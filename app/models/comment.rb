class Comment < ActiveRecord::Base
  belongs_to :target
end
