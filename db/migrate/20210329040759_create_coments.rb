class CreateComents < ActiveRecord::Migration[6.1]
  def change
    create_table :coments do |t|
      t.string :commneter
      t.text :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
