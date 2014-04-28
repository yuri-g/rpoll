class AddMultipleOptionsToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :multiple_options, :boolean
  end
end
