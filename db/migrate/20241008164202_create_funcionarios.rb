class CreateFuncionarios < ActiveRecord::Migration[7.1]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :contato
      
      t.string :login
      t.string :senha

      t.references :cargo, null: false, foreign_key: true
      t.timestamps
    end
  end
end
