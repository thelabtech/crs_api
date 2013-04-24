class AddSpouseVerificationKeyToCrs2Profile < ActiveRecord::Migration
  def change
    add_column :crs2_profile, :spouse_verification_key, :string
  end
end
