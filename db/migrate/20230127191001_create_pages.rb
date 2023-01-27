class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.references :content, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
