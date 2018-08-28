class CreateJoinTableCardsItems < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cards, :items do |t|
      # t.index [:card_id, :item_id]
      # t.index [:item_id, :card_id]
    end
  end
end
