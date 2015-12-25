require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  (holiday_hash[:winter].collect {|holiday, supplies| supplies}).flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  readout = ""
  holiday_hash.each do |season, holidays|
    season = season.slice(0,1).upcase + season.slice(1..-1)
    readout += ("#{season}:\n")
    holidays.each do |holiday, supplies|
      holiday = holiday.slice(0,1).upcase + holiday.slice(1..-1)
      if(holiday == "New_years")
        holiday = "New Years"
      elsif(holiday == "Fourth_of_july")
        holiday = "Fourth Of July"
      elsif(holiday == "Memorial_day")
        holiday = "Memorial Day"
      end
      readout += ("  #{holiday}: ")
      readout += (supplies.collect {|supply| supply.slice(0,1).upcase + supply.slice(1..-1)}).join(", ")
      readout += "\n"
    end
  end
  puts readout
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supply|
      (bbq_holidays << holiday) if supply.include?("BBQ")
    end
  end
  bbq_holidays
end







