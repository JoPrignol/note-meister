class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.references :post, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
