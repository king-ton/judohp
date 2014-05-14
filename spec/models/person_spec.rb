# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  last_name   :string(255)
#  first_name  :string(255)
#  gender      :boolean
#  birth_date  :date
#  birth_place :string(255)
#  street      :string(255)
#  zip         :integer
#  city        :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  nationality :string(255)
#

require 'spec_helper'

describe Person do
  pending "add some examples to (or delete) #{__FILE__}"
end
