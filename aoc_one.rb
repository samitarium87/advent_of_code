require 'csv'

file = File.open("/Users/sambennett/Desktop/data.txt") # Here I create the file object.
file_data = file.readlines.map(&:chomp)

column1 = []
column2 = []

file_data.each_with_index do |item |
  columns = item.split
  column1 << columns[0].to_i unless columns[0] == '0'
  column2 << columns[1].to_i unless columns[1] == '0'
end

column1_sorted = column1.sort
column2_sorted = column2.sort

differences = column1_sorted.zip(column2_sorted).map { |a, b| (a - b).abs }
total_difference = differences.sum
puts "Total Difference: #{total_difference}"
