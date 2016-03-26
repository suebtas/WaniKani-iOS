//
//  DashboardHeader.swift
//  
//
//  Created by Andriy K. on 8/19/15.
//
//

import UIKit

protocol SingleTitleViewModel: ViewModel {
  var title: String { get }
}

class DashboardHeader: UICollectionReusableView, SingleReuseIdentifier, ViewModelSetupable {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet private var coloredViews: [UIView]!
  
  var color: UIColor = UIColor(red:0.92, green:0.12, blue:0.39, alpha:1) {
    didSet {
      guard let coloredViews = coloredViews else {return}
      for v in coloredViews {
        v.backgroundColor = color
      }
    }
  }
  
  func setupWith(viewModel: SingleTitleViewModel) {
    titleLabel?.text = viewModel.title
  }
}

// MARK: - UICollectionReusableView
extension DashboardHeader {
  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel?.text = nil
  }
}

// MARK: - ViewModelSetupable
extension DashboardHeader {
  func setupWithViewModel(viewModel: ViewModel?) {
    guard let viewModel = viewModel as? SingleTitleViewModel else { return }
    setupWith(viewModel)
  }
}