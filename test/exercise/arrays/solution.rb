module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = max_value(array)

        array.each_with_object([]) do |element, final_array|
          final_array << (element.positive? ? max_value : element)
        end
      end

      def search(array, query, min = 0, max = array.size - 1)
        return -1 if array.empty? || wrong_value?(array, query, min, max) || out_of_array?(array, query, min, max)

        mid = (min + max) / 2

        return mid if array[mid] == query

        array[mid] < query ? min = mid + 1 : max = mid - 1

        search(array, query, min, max)
      end

      private

      def max_value(array)
        max_value = array[0]

        array.each do |element|
          max_value = element if element > max_value
        end
        max_value
      end

      def wrong_value?(*args)
        array, query, min, max = args

        array[min] == array[max] && array[min] != query
      end

      def out_of_array?(*args)
        array, query, min, max = args

        array[min] > query || array[max] < query
      end
    end
  end
end
