class CreateSayings < ActiveRecord::Migration[7.1]
  def change
    create_table :sayings do |t|
      t.text :content, null: false
      t.string :author_name, null: true
      t.integer :saying_type, null: false
      t.integer :status, null: false
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
