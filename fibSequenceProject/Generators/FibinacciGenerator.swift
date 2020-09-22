//
//  FibinacciGenerator.swift
//  fibSequenceProject
//
//  Created by Arin Davoodian on 1/22/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation

// fibinacci sequence equation referenced from: https://craftofcoding.wordpress.com/2017/05/30/fibonacci-in-swift/
func generateFibSequence(numberOfIterations n: Int) -> [Int] {
    var fibArray: [Int] = []
    
	fibArray.append(1)
    fibArray.append(1)
    
	for i in 2..<n {
        fibArray.append(fibArray[i - 1] + fibArray[i - 2])
    }
	return fibArray
}
