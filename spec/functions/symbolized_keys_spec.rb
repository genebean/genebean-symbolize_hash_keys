require 'spec_helper'

describe 'symbolized_keys' do
  it {
    is_expected.to run
      .with_params({ 'key1' => { 'subkey1' => 'subval1' }, 'key2' => 'val2' })
      .and_return('{:key1=>{"subkey1"=>"subval1"}, :key2=>"val2"}')
  }
end
