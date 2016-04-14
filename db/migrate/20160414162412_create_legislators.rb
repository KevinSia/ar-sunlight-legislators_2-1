class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |l|
      l.string :title
      l.string :state
      l.string :party
      l.string :firstname
      l.string :lastname
      l.string :middlename
      l.string :name_suffix
      l.string :phone
      l.string :fax
      l.string :website
      l.string :webform
      l.string :gender
      l.date :birthdate
      l.string :twitter_id
      l.boolean :in_office
    end
  end
end