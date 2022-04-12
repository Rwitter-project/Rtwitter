class CreateRweets < ActiveRecord::Migration[7.0]
  def change
    create_table :rweets do |t|
      t.belongs_to :user
      t.string :body
      t.timestamps
    end
  end
end
