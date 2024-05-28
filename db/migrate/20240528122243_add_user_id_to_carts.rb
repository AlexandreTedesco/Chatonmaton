# frozen_string_literal: true

class AddUserIdToCarts < ActiveRecord::Migration[7.1]
  def change
    add_reference :carts, :user, null: false, foreign_key: true
  end
end
