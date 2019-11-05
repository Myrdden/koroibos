class StatsSerializer
  include FastJsonapi::ObjectSerializer
  attribute(:total_competing_olympians) {|obj| obj.count}
  attribute(:average_weight) {|obj| obj.avg_weight}
  attribute(:average_age) {|obj| obj.avg_age}
end
