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
puts "------------------------"
puts "Note: ".colorize(:light_blue)
puts "(1) DataView 1.0 only works with clean data.".colorize(:light_blue)
puts "(2) DataView 1.0 needs you to distinguish between column data type to generate appropriate visualizations and descriptive statistics.".colorize(:light_blue)
puts "------------------------"

## get column names (*distinction between numerical and categorical columns)
### numerical
puts "Please enter the numerical column names, seperated by commas. (type 'none' to skip): ".colorize(:green)
num_columns = gets.chomp.split(',').map(&:strip)

if num_columns == 'none'
	## categorical columns
	puts "Please enter the categorical column names, seperated by commas: ".colorize(:green)
	cat_columns = gets.chomp.split(',').map(&:strip)

	if cat_columns == 'none'
		puts "You can't skip both data types.".colorize(:red)
	end
else
	puts "Please enter the categorical column names, seperated by commas. (type 'none' to skip): ".colorize(:green)
	cat_columns = gets.chomp.split(',').map(&:strip)
end

# start handling the data #
puts "Got it!".colorize(:light_blue)
puts "Generating visualizations ...".colorize(:light_blue)

## numerical
if num_columns != 'none'
	num_columns.each do |col|
		data = csv_data[col]

		# Histogram generation #
		histogram = Rubyplot::Histogram.new(400)
    	histogram.data data
    	## Save visualization with following naming convention
    	hist_fname = "#{col}-histogram-#{rand(100..999)}.png"
    	puts "Saving histogram of the '#{col}' column, as: #{hist_fname}"
    	histogram.write(hist_fname)
		

		# Boxplot generation #
		# ..
		## Save visualization with following naming convention
  		

  		# Descriptive statistics #
  		# ..
  		#
end



