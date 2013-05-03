module Obo
  class Header
    attr_reader :tagvalues

    def initialize
      @tagvalues = Hash.new{|h,k| h[k] = []}
    end

    def [](tag)
      values = @tagvalues[tag]
      values.length == 1 ? values.first : values
    end

    def add(tag,value)
      @tagvalues[tag] << value
    end
  end
end

