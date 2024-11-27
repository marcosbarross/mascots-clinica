class AddUserToFuncionarios < ActiveRecord::Migration[7.1]
  def change
    add_reference :funcionarios, :user, null: false, foreign_key: true
  end
end
