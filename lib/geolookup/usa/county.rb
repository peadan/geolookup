# encoding: UTF-8
module Geolookup
  module USA
    module County
      COUNTY_CODE_TO_NAME_FILE = 'COUNTY_CODE_TO_NAME.yml'
      COUNTY_NAME_TO_CODE_FILE = 'COUNTY_NAME_TO_CODE.yml'
      COUNTY_LAT_LONG_FILE     = 'COUNTY_LAT_LONG.yml'

      @county_code_to_name
      @county_name_to_code
      @county_lat_long

      ###################################################################
      # self.code_to_name
      #
      # Given a state and county code output the county name
      # Else return nil
      #
      # EX: code_to_name(1, 1) => "AUTAUGA"
      def self.code_to_name(state_code, county_code)
        @county_code_to_name ||= Geolookup.load_hash_from_file(COUNTY_CODE_TO_NAME_FILE)
        return nil unless @county_code_to_name[state_code.to_s.to_i]

        @county_code_to_name[state_code.to_s.to_i][county_code.to_s.to_i]
      end


      ###################################################################
      # self.name_to_code
      #
      # Given a state and county name output the county code
      # Else return nil
      #
      # EX: name_to_code(1, 'baldwin') => {1 => {"AUTAUGA" => 1, "BALDWIN" => 3, ....}}
      def self.name_to_code(state_code, county_name)
        @county_name_to_code ||= Geolookup.load_hash_from_file(COUNTY_NAME_TO_CODE_FILE)
        return nil unless @county_name_to_code[state_code.to_s.to_i]

        @county_name_to_code[state_code.to_s.to_i][county_name.to_s.upcase]
      end


      ###################################################################
      # self.code_to_lat_long
      #
      # Given a state and county code output county latitude longitude.  Else return nil
      #
      def self.code_to_lat_long(state_code, county_code)
        @county_lat_long ||= Geolookup.load_hash_from_file(COUNTY_LAT_LONG_FILE)
        return nil unless @county_lat_long[state_code.to_s.to_i]

        @county_lat_long[state_code.to_s.to_i][county_code.to_s.to_i]
      end
    end
  end
end
