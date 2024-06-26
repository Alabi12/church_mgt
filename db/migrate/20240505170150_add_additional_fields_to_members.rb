class AddAdditionalFieldsToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :title, :string
    add_column :members, :member_status, :string
    add_column :members, :communion_status, :string
    add_column :members, :nationality, :string
    add_column :members, :hometown, :string
    add_column :members, :region, :string
    add_column :members, :profession, :string
    add_column :members, :occupation, :string
    add_column :members, :employer, :string
    add_column :members, :educational_level, :string
    add_column :members, :day_born, :date
    add_column :members, :place_of_birth, :string
    add_column :members, :home_phone, :string
    add_column :members, :mobile, :string
    add_column :members, :work_phone, :string
    add_column :members, :email_address, :string
    add_column :members, :postal_address, :string
    add_column :members, :house_number, :string
    add_column :members, :location, :string
    add_column :members, :date_baptised, :date
    add_column :members, :place_of_baptism, :string
    add_column :members, :minister_baptism, :string
    add_column :members, :certificate_number_baptism, :string
    add_column :members, :date_confirm, :date
    add_column :members, :place_confirm, :string
    add_column :members, :minister_confirm, :string
    add_column :members, :certificate_number_confirm, :string
    add_column :members, :memory_verse, :string
    add_column :members, :date_joined, :date
    add_column :members, :how_become_member, :string
    add_column :members, :marital_status, :string
    add_column :members, :certificate_number_marriage, :string
    add_column :members, :date_of_marriage, :date
    add_column :members, :type_of_marriage, :string
    add_column :members, :place_of_marriage, :string
    add_column :members, :minister_marriage, :string
    add_column :members, :spouse_name, :string
    add_column :members, :home_town_spouse, :string
    add_column :members, :church_spouse, :string
    add_column :members, :mobile_number_spouse, :string
    add_column :members, :name_of_school, :string
    add_column :members, :school_address, :string
    add_column :members, :admission_date, :date
    add_column :members, :date_of_completion, :date
    add_column :members, :course, :string
  end
end
