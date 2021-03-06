# frozen_string_literal: true

class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations, id: :uuid do |t|
      t.references :link_instance, foreign_key: true, type: :uuid
      t.string :name, null: false
      t.string :alternate_name
      t.string :description, null: false
      t.string :email
      t.string :url
      t.string :tax_status
      t.string :tax_id
      t.date :year_incorporated
      t.string :legal_status

      t.timestamps
    end
  end
end
