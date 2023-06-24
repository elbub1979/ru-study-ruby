module Exercise
  module Fp
    class << self
      def rating(array)
        rating_films = array.select do |film|
          rating = film['rating_kinopoisk'].to_i
          country = film['country'].to_s

          film unless rating.zero? || country.empty? || country.split(',').size == 1
        end

        rating_films.inject(0) { |sum, film| sum + film['rating_kinopoisk'].to_f } / rating_films.size
      end

      def chars_count(films, threshold)
        film_names = films.filter_map { |film| film['name'] if film['rating_kinopoisk'].to_f >= threshold }

        film_names.inject(0) { |sum, name| sum + name.scan(/и/).size }
      end
    end
  end
end
