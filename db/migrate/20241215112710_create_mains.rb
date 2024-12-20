class CreateMains < ActiveRecord::Migration[8.0]
  def change
    create_table :mains do |t|
      t.string :url
      t.string :title
      t.string :time
      t.string :body

      t.timestamps
    end
  end
end
