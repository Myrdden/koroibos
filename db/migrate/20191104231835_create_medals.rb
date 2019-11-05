class CreateMedals < ActiveRecord::Migration[6.0]
  def change
    create_table :medals do |t|
      t.string :type

      t.references :event, foreign_key: true
      t.references :olympian, foreign_key: true
    end
  end
end
