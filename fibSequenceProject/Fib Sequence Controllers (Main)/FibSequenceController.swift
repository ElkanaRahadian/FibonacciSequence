import UIKi

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


