class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def capital_first_letter
    self.name = name.capitalize unless name.nil? 
  end
end
