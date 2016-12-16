class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :author_id
      t.integer :article_id
      t.integer :abuse_count, :default => 0

      t.timestamps
    end
  end
end
