class ChangeBookCommentToBookComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :book_comment, :book_comments
  end
end
