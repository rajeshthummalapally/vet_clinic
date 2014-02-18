class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :date_of_visit,       null: false
      t.references :pet, index: true,  null: false
      t.references :user, index: true, null: false
      t.string :customer,              null: false
      t.boolean :requires_reminder
      t.string :reason_for_visit,      null: false

      t.timestamps
    end
  end
end
