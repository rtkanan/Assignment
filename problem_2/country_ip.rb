require 'csv'
require "ipaddr"

class CountryIp

  def initialize
    # CSV file path
    @file_path= File.expand_path File.dirname(__FILE__)+"/IpToCountry.csv"
  end

  def search(ip_string)
    # gets integer ip for the given ip_string
    input_ip = get_integer_ip(ip_string)
    # reading the row from csv file
    CSV.foreach(@file_path, :encoding => 'windows-1251:utf-8', :quote_char => "\x00") do |row|
      begin
        # returns row[0] parsed string
        ip1 = get_valid_string(row[0])
        # skip comment line by checking the string starts with
        if check_valid_row(ip1)
          # returns row[1] parsed string
          ip2 = get_valid_string(row[1])
          # check the given ip falls between the ip range
          if check_ip(input_ip, ip1, ip2)
            # returns the country name here
            return get_valid_string(row[6])
            break
          end
        end
      rescue CSV::MalformedCSVError => e
      end
    end
  end

  # returns the integer Ip
  def get_integer_ip(ip_string)
    IPAddr.new(ip_string).to_i
  end

  # check the ip present between the ip range
  def check_ip(input_ip, ip1, ip2)
    input_ip.between?(ip1.to_i, ip2.to_i)
  end

  # check for comments line
  def check_valid_row(string)
    string.chr != "#"
  end

  # it removes the "/"
  def get_valid_string(row)
    row.parse_csv[0] if !row.nil?
  end

end
