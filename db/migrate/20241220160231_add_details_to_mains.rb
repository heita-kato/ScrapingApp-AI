class AddDetailsToMains < ActiveRecord::Migration[8.0]
  def change
    add_column :mains, :linkscore, :integer
    add_column :mains, :summary, :string
  end
end
