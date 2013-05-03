module Obo
  class Stanza
    attr_reader :name
    attr_reader :tagvalues

    def initialize(name)
      @name = name
      @tagvalues = Hash.new{|h,k| h[k] = []}
    end

    def [](tag)
      values = @tagvalues[tag]
      case values.length
      when 0
        nil
      when 1
        values.first
      else values
      end
    end

    def add(tag,value)
      @tagvalues[tag] << case value
                         when 'true'
                           true
                         when 'false'
                           false
                         else value
                         end
    end

    def method_missing(method, *args, &block)
      values = self[method.to_s]

      if values
        return values
      elsif method =~ /\?$/
        self.send(method[0..-2])
      else
        raise NoMethodError, "No method #{method} on #{self.class}"
      end

    end
  end
end

