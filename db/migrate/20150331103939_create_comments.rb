class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post
      t.string :author_name
      t.text :comment_content

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
