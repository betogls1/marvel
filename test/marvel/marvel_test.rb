require 'helper'

describe marvel do
	it 'it should have a version' do
		Marvel::VERSION.wont_be_nil
	end
end
