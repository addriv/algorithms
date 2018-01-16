Hackerland is a one-dimensional city with  houses, where each house  is located at some  on the -axis. The Mayor wants to install radio transmitters on the roofs of the citys houses. Each transmitter has a range, , meaning it can transmit a signal to all houses  units of distance away.

Given a map of Hackerland and the value of , can you find and print the minimum number of transmitters needed to cover every house in the city? (Every house must be covered by at least one transmitter) Each transmitter must be installed on top of an existing house.

def radio_transmitters(range, houses)
  sorted = houses.sort
  count = 1
  next_transmitter = sorted.first + range * 2
  sorted.each do |house|
    next if house <= next_transmitter
    next_transmitter = house + range * 2
    count += 1
  end

  count
end