# required packages dialogue & installation
puts "This program makes use of the following gems: \n - csv \n - colorize \n - rubyplot \n - descriptive_statistics"
puts "Do you want to install them? (y/n): "
package_install = gets.chomp.downcase
if package_install == 'y'
	gem 'csv'
	gem 'colorize'
	gem 'rubyplot'
	gem 'descriptive_statistics'
	require 'csv'
	require 'colorize'
	require 'rubyplot'
	require 'descriptive_statistics'
else
	require 'csv'
	require 'colorize'
	require 'rubyplot'
	require 'descriptive_statistics'
end

