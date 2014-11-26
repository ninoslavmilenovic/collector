class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.references :user, index: true
      t.text :content
      t.string :public_ip
      t.string :private_ip

      t.timestamps
    end
  end
end
