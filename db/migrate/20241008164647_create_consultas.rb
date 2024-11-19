class CreateConsultas < ActiveRecord::Migration[7.1]
  def change
    create_table :consultas do |t|
      t.references :funcionario, foreign_key: { to_table: :funcionarios }
      t.references :animal, null: false, foreign_key: true
      t.date :data
      t.time :hora
      t.text :observacao

      t.timestamps
    end
  end
end
