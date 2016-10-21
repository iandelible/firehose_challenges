def no_odds( values )
   values.delete_if {|value| value.odd? == true }
   return values

end

answer = no_odds([0,1,2,3,4,5,6,7])
puts answer