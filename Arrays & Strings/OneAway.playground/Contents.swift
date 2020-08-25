/*
Problem: given two strings, determine if they're one insertion, deletion, or
         replacement away from being the same.

Approaches:
   1) Iterate over the strings, keeping track of the changes needed. If the
      total number of changes needed > 1, return false. O(N) runtime and O(1)
      space.

Solution 1 is presented below.
*/

/// Determines if stings `a` and `b` are less than one change away from being the same.
func oneAway(_ a: String, _ b: String) -> Bool {
    let a = [Character](a)
    let b = [Character](b)
    var changesCount = 0
    
    // Edge cases.
    if a.count == 0 && b.count == 0 { return true }
    else if a.count == 0 && b.count > 1 { return false }
    else if a.count == 1 && b.count == 0 { return true }
    else if b.count == 0 && a.count > 1 { return false }
    else if b.count == 1 && a.count == 0 { return true }

    // The lengths of the strings must be equal or off by 1.
    if abs(a.count - b.count) == 0 || abs(a.count - b.count) == 1 {
        var i = 0
        var j = 0

        while true {
            if !(a[i] == b[j]) {
                // Deletion and insertion case.
                if j < b.count - 1 && a[i] == b[j + 1] {
                    changesCount += 1
                    j += 1
                } else if i < a.count - 1 && a[i + 1] == b[j] {
                    changesCount += 1
                    i += 1
                }
                // Replace case.
                else if a.count == b.count {
                    changesCount += 1
                }
                // Nothing can be done.
                else {
                    return false
                }
            }
            
            i += 1
            j += 1
            if i >= a.count || j >= b.count { break }
        }

        return changesCount < 2
    } else {
        return false
    }
}

func main() {
    let tests = [
        ["pale", "ple"],
        ["pales", "pale"],
        ["pale", "bale"],
        ["pale", "bake"],
        ["xyzaa", "xyzba"]
    ]

    for test in tests {
        print(oneAway(test[0], test[1]))
    }
}

main()
