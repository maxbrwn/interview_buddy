class CreateSpeechLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :speech_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.text :text
      t.datetime :generated_at

      t.timestamps
    end
  end
end
