class CreateOnlinePaymentChannels < ActiveRecord::Migration
  def change
    create_table :online_payment_channels do |t|
      t.integer :payment_channel_id
      t.string :payment_channel_type

      t.timestamps
    end
  end
end
