import Foundatio

func generateFibSequence(numberOfIterations n: Int) -> [Int] {
    var fibArray: [Int] = []
    
	fibArray.append(1)
    fibArray.append(1)
    
	for i in 2..<n {
        fibArray.append(fibArray[i - 1] + fibArray[i - 2])
    }
	return fibArray
}
