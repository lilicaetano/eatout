class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.time :meet_time

      t.timestamps
    end
  end
end
