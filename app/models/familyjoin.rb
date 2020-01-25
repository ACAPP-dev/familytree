class Familyjoin < ActiveRecord::Base

  belongs_to :familymember
  belongs_to :relationship

end