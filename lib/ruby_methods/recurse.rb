# Copied from
# https://github.com/rubyworks/facets/blob/master/lib/core/facets/hash/recurse.rb
#
# Apply a block to hash, and recursively apply that block
# to each sub-hash or +types+.
#
#   h = {:a=>1, :b=>{:b1=>1, :b2=>2}}
#   g = h.recurse{|h| h.inject({}){|h,(k,v)| h[k.to_s] = v; h} }
#   g  #=> {"a"=>1, "b"=>{"b1"=>1, "b2"=>2}}
#
def recurse(*types, &block)
  # rubocop:disable Style/ConditionalAssignment
  types = [self.class] if types.empty?
  h = each_with_object({}) do |hash, (key, value)|
    case value
    when *types
      hash[key] = value.recurse(*types, &block)
    else
      hash[key] = value
    end
    hash
  end
  yield h
  # rubocop:enable Style/ConditionalAssignment
end

# In place form of #recurse.
def recurse!(&block)
  replace(recurse(&block))
end
