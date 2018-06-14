# Symbolize top level keys of a hash
#
require_relative '../../ruby_methods/rekey.rb'

Puppet::Functions.create_function(:symbolized_keys) do
  dispatch :symbolized_keys do
    param 'Hash', :data
  end

  def symbolized_keys(data)
    data.rekey
  end
end
