class Category < ApplicationRecord
  has_many :terms
  validates :name, presence: true

  def self.get_default_category
    def_cat = find_by name: 'Default'
    if not def_cat
      def_cat = first
    end

    return def_cat
  end

  def self.get_names
    categories = {}
    Category.all.each do |c|
      categories[c.id] = c.name
    end

    return categories;
  end
end
