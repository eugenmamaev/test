WHEELS = 3
START_COMBINATION = [0, 0, 0]
END_COMBINATION = [1, 1, 1]
EXCLUDE_COMBINATION = [[0, 0, 1], [1, 0, 0], [1, 1, 0]]

code = START_COMBINATION.dup
history = EXCLUDE_COMBINATION
values = [START_COMBINATION]
while code != END_COMBINATION
  break if code.blank?
  success = false
  (WHEELS - 1).downto(0).each do |wheel|
    test_code = code.dup
    test_code[wheel] += 1
    if code[wheel] == END_COMBINATION[wheel] || history.include?(test_code)
      if !success && wheel == 0
        values.pop
        code = values.last.dup
      end
      break if code.blank?
      next
    end
    success = true
    code = test_code
    values << code.dup
    history << code.dup
  end
end

puts "There is no solution to these conditions" if code.blank?
puts values.inspect
