class CreateListeners < ActiveRecord::Migration[5.2]
  def change
    create_table :listeners do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
# acrecentar mais coisas posteriormente
# não adicionei pq acho que agora não é muito necessario, e tem
# alguns campos que são referências de outros, como playlist
# sempre que alterar aqui, precisa de db:migrate