class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title #本のタイトル
      t.string :body #感想
      t.integer :user_id #投稿したユーザを識別するID(usersテーブルのIDを保存)
      t.timestamps
    end
  end
end
