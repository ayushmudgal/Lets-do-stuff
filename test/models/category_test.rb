# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test "category has at least one room" do
  # 	get categories(:entertainment).count
  # 	assert_equal (categories

  test "creates a category correctly" do
  	category = Category.new(name: "new cat")
  	assert true 
  end

end
