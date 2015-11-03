class Hash

  class << self
    def nested_hash
      Hash.new { |h,k| h[k] = Hash.new(&h.default_proc) }
    end
  end

end
