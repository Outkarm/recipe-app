class ChangeFoodColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :price, 'integer USING CAST(price AS integer)'
  end
end
