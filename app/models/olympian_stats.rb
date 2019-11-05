class OlympianStats
  attr_accessor :id, :count, :avg_age, :avg_weight
  def initialize
    @id = 0
    @count = Olympian.count
    @avg_age = Olympian.average(:age).round(2)
    @avg_weight = {
      units: 'kg',
      male_olympians: Olympian.where(sex: 'M').average(:weight).round(2),
      female_olympians: Olympian.where(sex: 'F').average(:weight).round(2)
    }
  end
end
