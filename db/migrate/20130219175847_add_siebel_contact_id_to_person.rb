class AddSiebelContactIdToPerson < ActiveRecord::Migration
  def change
    add_column :ministry_person, :siebel_contact_id, :string, length: 20
    add_index :ministry_person, :siebel_contact_id
  end
end
