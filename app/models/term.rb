class Term < ApplicationRecord
  belongs_to :category
  before_save :set_default_values

  def set_default_values
    if not self.learning_updated
      self.learning_updated = DateTime.now
    end
  end
end
