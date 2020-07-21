class Term < ApplicationRecord
  has_many :examples, dependent: :destroy
  belongs_to :category
  before_save :set_default_values
  validates :term_text, presence: true

  def set_default_values
    if not self.learning_updated
      self.learning_updated = DateTime.now
    end
  end
end
