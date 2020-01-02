class CreateStweets < ActiveRecord::Migration[6.0]
  def change
    create_table :stweets do |t|
      t.text :stweet

      t.timestamps
    end
  end
end
