# **********************************************************************************************************
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
# required librairies // Don't know if Gem is better than librairies in Ruby
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
require 'json'

# **********************************************************************************************************
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
# Files init for the report generation
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
def setup_files
    path = File.join(File.dirname(__FILE__), '../data/products.json')
    file = File.read(path)
    $products_hash = JSON.parse(file)
    $report_file = File.new("report.txt", "w+")
end


# **********************************************************************************************************
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
# Unit Methods to re-use in to the project
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
# **********************************************************************************************************


# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# Simple method to separate the diffrent topics
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

def separator
	puts "                                                                       "
	puts "***********************************************************************"
	puts "                                                                       "
end



# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# Func_Requ_01
# Criteria : Print today's date on the report
#
# ###############################################################################
# Required Specifications :
# The generated report should have the current date at the top of the report
#
#
#
#
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

def report_date
	"Date of report : #{Time.now}"
end


# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# Func_Requ_02
# Criteria : Print today's date on the report
#
# ###############################################################################
# Required Specifications :
#
# => Print Sales Report date
# => Print Sales report label
#
#
#
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


def print_heading(file)
	file.puts(report_date)
	file.puts("                                                                                ")
	file.puts("                                                                                ")
	file.puts(" _________      .__                  __________                             __  ")
	file.puts("/   _____/____  |  |   ____   ______ \______   \ ____ ______   ____________/  |_ ")
	file.puts("\_____  \\__  \ |  | _/ __ \ /  ___/  |       _// __ \\____ \ /  _ \_  __ \   __\ ")
	file.puts("/        \/ __ \|  |_\  ___/ \___ \   |    |   \  ___/|  |_> >  <_> )  | \/|  | ")
	file.puts("_______  (____  /____/\___  >____  >  |____|_  /\___  >   __/ \____/|__|   |__|  ")
	file.puts("        \/     \/          \/     \/          \/     \/|__|   ")
	file.puts("                                                                                ")
	file.puts("        ")
end


# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# Func_Requ_03
# Criteria : Manage sales information related to the product onto the report
#
# ###############################################################################
# For each product in the data set:
# => (1) Print the name of the toy //// Done
# => (2 )Print the retail price of the toy //// Done
# => (3) Calculate and print the total number of purchases //// Done
# => (4) Calculate and print the total amount of sales //// Done
# => (5) Calculate and print the average price the toy sold for //// Done
# => (6) Calculate and print the average discount (% or $) based off the average sales price
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


def make_product_section(file,products)

	file.puts("                                                                                ")
	file.puts("                                                                                ")
	file.puts("                     _            _       ")
	file.puts("                    | |          | |      ")
	file.puts(" _ __  _ __ ___   __| |_   _  ___| |_ ___ ")
	file.puts("| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|")
	file.puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
	file.puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
	file.puts "| |                                       "
	file.puts "|_|     "
	file.puts("                                                                                ")
	file.puts("                                                                                ")


	# ------------------------------------------------------------------------------
	# For each product in the data set:
	# ------------------------------------------------------------------------------
	products["items"].each do |toy|

		# ---------------------------------------------------------------------------
	  # (1) Print the name of the toy
		# ---------------------------------------------------------------------------
		file.puts "***********************************************************************"
		file.puts "Product reference: #{toy["title"]}"

		# ---------------------------------------------------------------------------
	  # (2) Print the retail price of the toy
		# ---------------------------------------------------------------------------
		file.puts "Retail price: #{toy["full-price"]}$"

		# ---------------------------------------------------------------------------
	  # (3) Calculate and print the total number of purchases
		# ---------------------------------------------------------------------------
		file.puts "Number of purchases for this reference: #{toy["purchases"].length}"

		# ---------------------------------------------------------------------------
	  # (4) Calculate and print the total amount of sales
		# ---------------------------------------------------------------------------
		total_amount_sales = 0
		toy["purchases"].each do |purchase|
			total_amount_sales = total_amount_sales + purchase["price"]
		end
		file.puts "Total amount of sales without the shipping cost: #{total_amount_sales}$"

		# ---------------------------------------------------------------------------
	  # (5) Calculate and print the average price the toy sold for
		# ---------------------------------------------------------------------------
		file.puts "Average price for the reference without the shipping cost: #{total_amount_sales/toy["purchases"].length}$"

		# ---------------------------------------------------------------------------
	  # (6) Calculate and print the average discount (% or $) based off the average sales price
		#
		# ---------------------------------------------------------------------------
		#file.puts "Percentage of discount: #{((toy["full-price"].to_f-(total_amount_sales/toy["purchases"].length))/toy["full-price"].to_f).round(2)*100}%"







	end
end


# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# Func_Requ_04
# Criteria : Manage sales information related to the brand onto the report
#
# ###############################################################################
# For each brand in the data set:
# => (1) Print the name of the brand
# => (2) Count and print the number of the brand's toys we stock
# => (3) Calculate and print the average price of the brand's toys
# => (4) Calculate and print the total sales volume of all the brand's toys combined
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# Simple method to get the list of brands according the JSON file provided
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

def get_the_list_of_brands(file)
	brands = Array.new
	file["items"].each do |toy|
		already_exist = false
		brands.each do |brand|
			if brand == toy["brand"]
				already_exist = true
			end
		end
		if already_exist == false
			brands.push(toy["brand"])
		end
	end
	return brands
end





def make_brand_section(file,products)
	file.puts("                                                                                ")
	file.puts("                                                                                ")
	file.puts( " _                         _     ")
	file.puts("| |                       | |    ")
	file.puts("| |__  _ __ __ _ _ __   __| |___ ")
	file.puts("| '_ \\| '__/ _` | '_ \\ / _` / __|")
	file.puts("| |_) | | | (_| | | | | (_| \\__ \\")
	file.puts("|_.__/|_|  \\__,_|_| |_|\\__,_|___/")
	file.puts("                                                                                ")
	file.puts("               ")

	brandslist = get_the_list_of_brands(products)

	# -----------------------------------------------------------------------------
	# Genarating the report by brand according the list of brands gathered into the
	# file.
	# -----------------------------------------------------------------------------

	brandslist.each do |brand|

		# Var initialization by brand
		nb_stocked_unit = 0
		total_amount_sales_brand = 0
		total_amount_purchase_brand = 0
		# Products selection by brand
		toys_list = products["items"].select do |toy|
			toy["brand"] == brand
		end

		# ---------------------------------------------------------------------------
		# (1) Print the name of the brand
		# ---------------------------------------------------------------------------
		file.puts("***********************************************************************")
		file.puts("Sales information for the brand #{brand}")

		# ---------------------------------------------------------------------------
		# (2) Count and print the number of the brand's toys we stock
		# ---------------------------------------------------------------------------

	  toys_list.each do |toy|
			nb_stocked_unit = nb_stocked_unit + toy["stock"]
		end
		file.puts("Number of the stock units available: #{nb_stocked_unit}")


		# ---------------------------------------------------------------------------
		# (3) Calculate and print the average price of the brand's toys
		# Average price = sum of the toy's prices / number of toys
		# ---------------------------------------------------------------------------

		total_sum_prices = 0
		total_toys_ref = 0
		toys_list.each do |toy|

			# Calculate the total amount of sales for one toy reference for one brand
			# For one refrence , make the sum of the amount of the purchases

			total_sum_prices = total_sum_prices + toy["full-price"].to_f
			total_toys_ref = total_toys_ref + 1
		end
		file.puts "Number of toys references #{total_toys_ref}"
		file.puts "Average price of the brand toys: #{(total_sum_prices/total_toys_ref).round(2)}$"

		# ---------------------------------------------------------------------------
		# (4) Calculate and print the total sales volume of all the brand's toys combined
		# ---------------------------------------------------------------------------

		toys_list.each do |toy|
			total_amount_sales_toy = 0
			total_purchases_toys = 0
			# Calculate the total amount of sales for one toy reference for one brand
			# For one refrence , make the sum of the amount of the purchases
			toy["purchases"].each do |purchase|
				total_amount_sales_toy = total_amount_sales_toy + purchase["price"]
				total_purchases_toys = total_purchases_toys + 1
			end

			# Calculate and print the total amount of sales for all toys references for one brand
			# Make the sum of the totals of the purchases by produduct
			total_amount_sales_brand = total_amount_sales_brand + total_amount_sales_toy
			total_amount_purchase_brand = total_amount_purchase_brand + total_purchases_toys
		end

		file.puts( "Total amount of sales for the brand without shipping cost: #{total_amount_sales_brand.round(2)}$")

	end




end






















# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# Print data method is used to gather and fill the report information related to
# the sales by product and by brand
#
#
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

def print_data(file,products)

		make_product_section(file,products)
		make_brand_section(file,products)

end


# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#  create_report method is used to generate the file
#
#
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

def create_report
	setup_files
	print_heading($report_file)
	print_data($report_file,$products_hash)
end


# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# Main method executed into the main programm in order to generate the report
#
#
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

def start
	separator
	puts "The sales report is generating please wait for the end of execution at #{Time.now}"
	separator
	create_report
	separator
	puts "The sales report has been generated sucessfully at #{Time.now}"
end


# **********************************************************************************************************
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
# 																							Main programm
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
# **********************************************************************************************************

start

# //////////////////////////////////////////////////////////////////////////////////////////////////////////
# //////////////////////////////////////////////////////////////////////////////////////////////////////////
# //////////////////////////////////////////////////////////////////////////////////////////////////////////
# 																								End of file
# //////////////////////////////////////////////////////////////////////////////////////////////////////////
# //////////////////////////////////////////////////////////////////////////////////////////////////////////
# //////////////////////////////////////////////////////////////////////////////////////////////////////////










# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# Tec-Requ-01
# Criteria : The student has successfully output report information to a text file.
#
# ###############################################################################
# Get path to products.json, read the file into a string,
# and transform the string into a usable hash
#
#
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$





















# For each brand in the data set:
