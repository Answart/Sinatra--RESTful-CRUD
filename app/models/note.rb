class Note < ActiveRecord::Base
  validates_presence_of :title, :message
end
