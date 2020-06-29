class AddLearnStatusToTerms < ActiveRecord::Migration[6.0]
  def change
    add_column :terms, :learning, :boolean, :default => true
    add_column :terms, :learning_updated, :datetime
  end
end
