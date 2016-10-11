class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries, comment: "2-digit ISO country codes and full names" do |t|
      t.string :code
      t.string :name
    end
  end
end
