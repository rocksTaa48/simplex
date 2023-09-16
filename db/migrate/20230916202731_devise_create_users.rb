# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table(:users) do |t|
      t.string(:name, null: false)
      t.string(:email, null: false, default: "", index: {unique: true})
      t.string(:encrypted_password, null: false, default: "")
      t.string(:phone, null: false, index: {unique: true})
      t.string(:aasm_state, null: false)
      t.string(:reset_password_token, index: {unique: true})
      t.datetime(:reset_password_sent_at)

      t.datetime(:remember_created_at)

      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      t.string(:confirmation_token)
      t.datetime(:confirmed_at)
      t.datetime(:confirmation_sent_at)
      # Only if using reconfirmable
      t.string(:unconfirmed_email)

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.timestamps(null: false)
    end
  end
end
