class CreateTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :terms do |t|
      t.text :term_text
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
