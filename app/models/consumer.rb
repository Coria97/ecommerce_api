# == Schema Information
#
# Table name: consumers
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_consumers_on_email                 (email) UNIQUE
#  index_consumers_on_reset_password_token  (reset_password_token) UNIQUE
#
class Consumer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :encrypted_password, :first_name, :last_name, presence: true
end
