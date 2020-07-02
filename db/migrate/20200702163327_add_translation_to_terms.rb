class AddTranslationToTerms < ActiveRecord::Migration[6.0]
  def change
    add_column :terms, :translation, :string
  end
end
