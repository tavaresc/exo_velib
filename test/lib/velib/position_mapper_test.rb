require 'test_helper'

module Velib
  class PositionMapperTest < ActiveSupport::TestCase
        setup do
      @mapper = PositionMapper.new
    end
    test 'should correctly map' do
      position_hash = JSON.parse(get_json_from_file('velib/station'), symbolize_names: true)[:position]
      position = @mapper.map(position_hash)

      assert_equal Position, position.class
      assert_equal 43.250903869637334, position.lat
    end
  end
end