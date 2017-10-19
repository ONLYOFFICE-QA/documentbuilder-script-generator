require 'spec_helper'

describe String do
  it '#to_underscore' do
    expect('AddNew- Test - JPG'.to_underscore).to eq('add_new_test_jpg')
  end
end
