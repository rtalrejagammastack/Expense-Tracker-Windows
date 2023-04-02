# frozen_string_literal: true

# Application Model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def capital_first_letter
    self.name = name.capitalize unless name.nil?
  end

  def generated_slug
    @random_slug ||= persisted? ? friendly_id : SecureRandom.hex(8)
  end
  WillPaginate.per_page = 10
end
