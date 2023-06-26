module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return to_enum unless block_given?
        return self if size.zero?

        block.call(first)
        self.class.new(self[1..]).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        return to_enum unless block_given?

        my_reduce(self.class.new) { |accumulator, element| accumulator << block.call(element) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) do |accumulator, element|
          element.nil? ? accumulator : accumulator << element
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(accumulator = nil, &block)
        return accumulator if size.zero?

        accumulator = accumulator.nil? ? first : block.call(accumulator, first)

        self.class.new(self[1..]).reduce(accumulator, &block)
      end
    end
  end
end
