class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :usuario
      t.string :nombre
      t.string :apellido
      t.string :twitter

      t.timestamps
    end
  end
end
