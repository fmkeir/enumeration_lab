class StarSystem
  attr_reader :name, :planets
  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names
    return @planets.map{|planet| planet.name}
  end

  def get_planet_by_name(name)
    return @planets.find{|planet| planet.name == name}
  end

  def get_largest_planet
    return @planets.max_by{|planet| planet.diameter}
  end

  def get_smallest_planet
    return @planets.min_by{|planet| planet.diameter}
  end

  def get_planets_with_no_moons
    return @planets.find_all{|planet| planet.number_of_moons == 0}
  end

  def get_planets_with_more_moons(number_of_moons)
    found_planets = @planets.find_all{|planet| planet.number_of_moons > number_of_moons}
    return found_planets.map { |planet| planet.name}
  end

  def get_number_of_planets_closer_than(distance_from_sun_1million_km)
    return @planets.count {|planet| planet.distance_from_sun < distance_from_sun_1million_km}
  end

  def get_total_number_of_moons
    @planets.reduce(0) { |total, planet| total += planet.number_of_moons}
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun
    planets_found = @planets.sort_by {|planet| planet.distance_from_sun}
    return planets_found.map {|planet| planet.name}
  end

  def get_planet_names_sorted_by_size_decreasing
    planets_found = @planets.sort_by {|planet| planet.diameter}.reverse
    return planets_found.map {|planet| planet.name}
  end

end
