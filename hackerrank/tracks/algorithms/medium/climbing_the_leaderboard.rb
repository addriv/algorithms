# Alice is playing an arcade game and wants to climb to the top of the leaderboard. Can you help her track her ranking as she plays? The game uses Dense Ranking, so its leaderboard works like this:

# The player with the highest score is ranked number 1 on the leaderboard.
# Players who have equal scores receive the same ranking number, and the next player(s) receive the immediately following ranking number.
# We want to determine Alice's rank as she progresses up the leaderboard. For example, the four players on the leaderboard have high scores of 100, 90, 90, and 80. Those players will have ranks 1, 2, 2, and 3, respectively. If Alice's scores are 70, 80 and 105, her rankings after each game are 4th, 3rd and 1st.

# You are given an array, scores, of monotonically decreasing leaderboard scores, and another array, alice, of Alice's scores for the game. You must print m integers. The jth integer should indicate the current rank of alice after her jth game.

# Input Format

# The first line contains an integer n, the number of players on the leaderboard. 
# The next line contains n space-separated integers scores[i, the leaderboard scores in decreasing order. 
# The next line contains an integer, m, denoting the number games Alice plays. 
# The last line contains m space-separated integers alice[j], her game scores.

# Example:
# Input: 

# Scores: [100, 100, 50, 40, 40, 20, 10]
# Alice: [5,25,50,120]
# Correct Output: [6, 4, 2, 1]

# Naive Solution = O(n^2) time complexity
def climbingLeaderboard(scores, alice)
    results = []
    unique_scores = scores.uniq
    
    alice.each do |alice_score|
        unique_scores.each_with_index do |score, i|
            if score <= alice_score
                results.push(i + 1)
                break
            elsif i == unique_scores.length - 1
                results.push(i + 2)
            end
        end
    end
        
    return results
end
