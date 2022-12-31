class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false  #ユーザーログインと紐付け
      t.string :title
      t.text :content
      t.datetime :start_time

      t.timestamps
    end
  end
end
