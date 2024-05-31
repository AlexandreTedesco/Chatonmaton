class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :cart
      t.string :stripe_session_id
      t.timestamps
    end
  end
end
