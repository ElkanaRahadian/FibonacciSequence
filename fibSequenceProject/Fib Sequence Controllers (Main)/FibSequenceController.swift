//
//  FibSequenceController.swift
//  fibSequenceProject
//
//  Created by Arin Davoodian on 1/22/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit

class FibSequenceController: UIViewController {

	var fibSequence: [Int] = []
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		fibSequence = generateFibSequence(numberOfIterations: 50)
	}
}

extension FibSequenceController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return fibSequence.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? labelCollectionViewCell else {
			print("Error with collection cell init")
			return UICollectionViewCell()
		}
		
		cell.fibSequenceUnitLabel.text = "\(fibSequence[indexPath.row])"
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let minCellSpacingiPad: CGFloat = 10
		let minCellSpacingiPhone: CGFloat = 5

		// determines the height and width of the cell based on minCell spacing, adjustments based on cell-to-cell doubling, and number of cells in width lenght
		
		//let iPhoneWidthHeight = (collectionView.frame.size.width / 7) - (minCellSpacingiPhone * 7 - (minCellSpacingiPhone / 0.18))
		//let iPhoneWidthHeight = (collectionView.frame.size.width / 6) - (minCellSpacingiPhone * 6 - (minCellSpacingiPhone / 0.21))
		//let iPhoneWidthHeight = (collectionView.frame.size.width / 5) - (minCellSpacingiPhone * 5 - (minCellSpacingiPhone / 0.27))
		//let iPhoneWidthHeight = (collectionView.frame.size.width / 4) - (minCellSpacingiPhone * 4 - (minCellSpacingiPhone / 0.4))
		
		let iPadWidthHeight = (collectionView.frame.size.width / 3) - (minCellSpacingiPad * 3 - (minCellSpacingiPad * 1.5))
		let iPhoneWidthHeight = (collectionView.frame.size.width / 2) - (minCellSpacingiPhone * 2 - (minCellSpacingiPhone / 2))
		
		if UIDevice.current.userInterfaceIdiom == .pad {
			 return CGSize(width: iPadWidthHeight, height: iPadWidthHeight)
		}
		else {
			 return CGSize(width: iPhoneWidthHeight, height: iPhoneWidthHeight)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		if UIDevice.current.userInterfaceIdiom == .pad {
			 return 10
		}
		else {
			 return 5
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		if UIDevice.current.userInterfaceIdiom == .pad {
			 return 10
		}
		else {
			 return 5
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		if UIDevice.current.userInterfaceIdiom == .pad {
			 return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		}
		else {
			 return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
		}
		
	}

}


