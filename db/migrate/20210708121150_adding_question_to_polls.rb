class AddingQuestionToPolls < ActiveRecord::Migration[6.1]
  def change
    add_column :polls, :question, :text, after: :name
  end
end
