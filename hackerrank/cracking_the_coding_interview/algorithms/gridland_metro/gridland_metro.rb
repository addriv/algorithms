def gridlandMetro(n, m, k, tracks)
    n_cells = n * m
    track_cells = Hash.new({})
    tracks.each do |track|
        track_cells[track[0]] = {}
        for track_i in (track[1]..track[2])
            track_cells[track[0]][track_i] = 1
        end
    end

    n_track_cells = 0
    track_cells.each { |row, cells|  n_track_cells += cells.keys.count }


    n_cells - n_track_cells
end