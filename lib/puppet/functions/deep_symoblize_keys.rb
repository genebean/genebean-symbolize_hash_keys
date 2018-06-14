# Symbolize all keys of a hash
#
require_relative '../../ruby_methods/deep_rekey'

Puppet::Functions.create_function(:deep_symbolized_keys) do
  dispatch :deep_symbolized_keys do
    param 'Hash', :data
  end

  def deep_symbolized_keys(data)
    data.deep_rekey
  end
end
