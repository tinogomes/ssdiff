require "ssdiff/version"

module Super
  module Stupid
    module Diff
      module ClassMethods
        def ssdiff(a, b)
          return [] if a == b
          return [a, b] unless a.instance_of?(b.class)

          convert_to_hash = false

          if a.instance_of?(String)
            a = a.split
            b = b.split
          end

          if a.instance_of?(Hash)
            a = a.to_a
            b = b.to_a
            convert_to_hash = true
          end

          ((a - b) + (b -a))
        end
      end

      module InstanceMethods
        def ssdiff(a)
          self.class.ssdiff(self, a)
        end
      end

      def self.included(receiver)
        receiver.extend         ClassMethods
        receiver.send :include, InstanceMethods
      end
    end
  end
end

Object.__send__(:include, Super::Stupid::Diff)
