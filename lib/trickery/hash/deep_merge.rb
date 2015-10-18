class ::Hash
  def deep_merge(*hashes)
    merger = proc do |key, v1, v2|
      Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : (v2.nil? ? v1 : v2)
    end
    hashes.inject(self) do |result, other|
      result.merge(other, &merger)
    end
  end
end
