class CreateOlympianEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :olympian_events, id: false do |t|
      t.references :olympian, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
    end
  end
end
