class Hash

  class << self
    def new_nested
      Hash.new { |h,k| h[k] = Hash.new(&h.default_proc) }
    end
  end

end
