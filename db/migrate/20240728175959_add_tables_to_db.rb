class AddTablesToDb < ActiveRecord::Migration[7.1]
  def change
    create_table :subjects do |t|
      t.string :name

      t.timestamps
    end

    create_table :posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end

    create_table :tags do |t|
      t.references :post, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
