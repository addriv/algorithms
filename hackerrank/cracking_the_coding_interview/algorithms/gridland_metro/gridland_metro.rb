def gridlandMetro(n, m, k, tracks)
    n_cells = n * m
    track_cells = {}
    tracks.each do |track|
        track_cells[track[0]] ||= []
        track_cells[track[0]].push([track[1], track[2]])
    end

    n_track_cells = 0

    # puts track_cells

    track_cells.each do |row, tracks|
        sorted = tracks.sort_by { |track| track[0] }
        # puts tracks
        sorted.each_with_index do |track, i|
            if i == 0 || sorted[i - 1][1] < track[0]
                n_track_cells += (track[1] - track[0] + 1)
            elsif sorted[i - 1][0] <= track[0] && sorted[i - 1][1] >= track[1]
                next
            else
                n_track_cells += (track[1] - track[0] + 1 - (sorted[i - 1][1] - track[0] + 1))
            end
        end
    end

   n_cells - n_track_cells
end