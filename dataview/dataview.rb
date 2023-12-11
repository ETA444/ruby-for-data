# required packages dialogue & installation #
puts "This program makes use of the following gems: \n - csv \n - colorize \n - rubyplot \n - descriptive_statistics"
puts "Do you want to install them? (y/n): "
package_install = gets.chomp.downcase
if package_install == 'y'
	puts 'Installing ...'
	gem 'csv'
	gem 'colorize'
	gem 'rubyplot'
	gem 'descriptive_statistics'
	require 'csv'
	require 'colorize'
	require 'rubyplot'
	require 'descriptive_statistics'
	puts 'Installations complete!'.colorize(:light_blue)
	puts '------------------------'
else
	require 'csv'
	require 'colorize'
	require 'rubyplot'
	require 'descriptive_statistics'
end

# welcome dialogue and info gathering/preparation #
puts "Welcome to DataView! (version 1.0)".colorize(:light_blue)

## get the file path
puts "Please enter the full file path to your CSV file: ".colorize(:green)
file_path = gets.chomp
puts "Great, got it.".colorize(:light_blue)
puts "------------------------"

## handle .csv without headers
puts "Does your CSV file have headers? (y/n): ".colorize(:green)
headers = gets.chomp.downcase

if headers == 'y'
	begin 
		csv_data = CSV.read(file_path, headers: true)
	rescue # file path custom error handling
		puts "Error reading file. Please check the file path and try again.".colorize(:red)
		exit
	end
else
	puts "DataView relies on headers to work. Please add headers or use another file.".colorize(:red)
	exit
end

## choosing the columns to work with
puts "Available columns: #{csv_data.headers.join(', ')}".colorize(:yellow)
puts "Note: DataView 1.0 only works with numeric columns."
puts "Please enter the columns you want to work with, separated by commas:".colorize(:green)
selected_columns = gets.chomp.split(',').map(&:strip)

### checking columns (need to be numeric)

