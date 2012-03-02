module DataMapper
  module Enum
    def self.included(receiver)
      receiver.extend ClassMethods
      attr_reader :name_property
    end

    module ClassMethods
      def acts_as_enumerated(options = {})
        @name_property = options.delete(:name_property) || :name
        @enums_cache = {}
      end

      def update_enums_cache!
        @enums_cache = {}
        @cache_update_flag = true
        all.each do |model|
          name = model.send(@name_property).to_sym
          @enums_cache[name] = model
        end
      end

      def [](name)
        if model = @enums_cache[name.to_sym]
          model
        elsif !@cache_update_flag
          raise RuntimeError.new("Looks like you forgot to call `#{self}.update_enums_cache!` before using `#{self}[#{name.inspect}]`")
        else
          nil
        end
      end
    end

  end
end
