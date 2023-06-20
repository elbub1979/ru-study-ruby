module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array[0]
        final_array = []

        array.each do |element|
          max_value = element if element > max_value
        end

        array.each do |element|
          final_array << (element.positive? ? max_value : element)
        end
        final_array
      end

      def search(_array, _query, min = 0, max = _array.size - 1)
        return -1 if _array.empty?
        return -1 if min == max && _array[min] != _query

        mid = (min + max) / 2

        case _array[mid] <=> _query
        when 0
          return mid
        when -1
          min = mid + 1
        when 1
          max = mid - 1
        end
        search(_array, _query, min, max)
      end
    end
  end
end