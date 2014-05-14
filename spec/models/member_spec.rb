# == Schema Information
#
# Table name: members
#
#  id               :integer          not null, primary key
#  member_number    :string(255)
#  entry            :date
#  exit             :date
#  entry_federation :date
#  exit_federation  :date
#  person_id        :integer
#  dad_id           :integer
#  mum_id           :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe Member do
  pending "add some examples to (or delete) #{__FILE__}"
end
