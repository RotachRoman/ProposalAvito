//
//  ProposalViewControllerTests.swift
//  ProposalAvitoTests
//
//  Created by Rotach Roman on 07.01.2021.
//

import XCTest

@testable import ProposalAvito

class ProposalViewControllerTests: XCTestCase {

    var sut: ProposalViewController!
    
    override func setUpWithError() throws {
        sut = ProposalViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testHasHeadTitle(){
        XCTAssertNotNil(sut.headTitleLabel)
        XCTAssertTrue(sut.headTitleLabel.isDescendant(of: sut.view))
    }
    
    func testHasCancelImageView(){
        XCTAssertNotNil(sut.cancelImageView)
        XCTAssertTrue(sut.cancelImageView.isDescendant(of: sut.view))
    }
    
    func testHasCollectionView(){
        XCTAssertNotNil(sut.collectionView)
        XCTAssertTrue(sut.collectionView.isDescendant(of: sut.view))
    }
    
    func testHasChooseButton(){
        XCTAssertNotNil(sut.chooseButton)
        XCTAssertTrue(sut.chooseButton.isDescendant(of: sut.view))
    }
    
    func testHeadTitleTranslatesAutoresizingMaskIntoConstraintsFalse(){
        XCTAssertFalse(sut.headTitleLabel.translatesAutoresizingMaskIntoConstraints)
    }
    
    func testCollectionViewTranslatesAutoresizingMaskIntoConstraintsFalse(){
      XCTAssertFalse(sut.collectionView.translatesAutoresizingMaskIntoConstraints)
  }
    
    func testWhenViewIsLoadedCollectionViewDelegateIsSet(){
        XCTAssertTrue(sut.collectionView.delegate is DataProvider)
    }
    
    func testWhenViewIsLoadedCollectionViewDataSourceIsSet() {
        XCTAssertTrue(sut.collectionView.dataSource is DataProvider)
    }
    
    func testWhenViewIsLoadedCollectionViewDelegateEqualsCollectionViewDataSource() {
        XCTAssertEqual(
            sut.collectionView.delegate as? DataProvider,
            sut.collectionView.dataSource as? DataProvider
        )
    }
    
    func testProposalVCHasButtonWithAlert(){
        let target = sut.chooseButton.target(forAction: #selector(sut.chooseAction), withSender: .none)
        
        sut.chooseButton.sendActions(for: .touchUpInside)

        XCTAssertEqual(target as? ProposalViewController, sut)
    }
    
    func testInitCancelImageWithTrueName() {
        let image = UIImage(named: "CloseIconTemplate")
        XCTAssertNotNil(image)
        XCTAssertEqual(image, sut.cancelImageView.image)
    }
    
    func testInitHeadTitleWithTitle(){
        let headProposal = HeadProposal(mainTitle: "Foo", titleActionButton: "Bar", actionTitle: "Tool")
        sut.configure(headProposal: headProposal)
        XCTAssertEqual(sut.headTitleLabel.text, "Foo")
    }
    
    func testIninButtonWithTitle(){
        let headProposal = HeadProposal(mainTitle: "Foo", titleActionButton: "Bar", actionTitle: "Tool")
        sut.configure(headProposal: headProposal)
        XCTAssertEqual(sut.chooseButton.titleLabel?.text, "Bar")
    }

    //MARK: - Constraints
    
    func testCancelImageViewHasTopConstraint(){
        let hasTopConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UIImageView) == sut.cancelImageView) &&
                (constraint.firstAnchor == sut.cancelImageView.topAnchor) &&
                ((constraint.secondItem as? UILayoutGuide) == sut.view.safeAreaLayoutGuide) &&
                (constraint.secondAnchor == sut.view.safeAreaLayoutGuide.topAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 17 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasTopConstraint)
    }
    
    func testCancelImageViewHasLeadingConstraint(){
        let hasLeadingConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UIImageView) == sut.cancelImageView) &&
                (constraint.firstAnchor == sut.cancelImageView.leadingAnchor) &&
                ((constraint.secondItem as? UILayoutGuide) == sut.view.safeAreaLayoutGuide) &&
                (constraint.secondAnchor == sut.view.safeAreaLayoutGuide.leadingAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 12 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasLeadingConstraint)
    }
    
//    func testCancelImageViewHasWidthConstraint(){
//
//    }
    
    func testHeadTitleLabelHasTopConstraint(){
        let hasTopConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UILabel) == sut.headTitleLabel) &&
                (constraint.firstAnchor == sut.headTitleLabel.topAnchor) &&
                ((constraint.secondItem as? UIImageView) == sut.cancelImageView) &&
                (constraint.secondAnchor == sut.cancelImageView.bottomAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 38 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasTopConstraint)
    }
    
    func testHeadTitleLabelHasLeadingConstraint(){
        let hasLeadingConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UILabel) == sut.headTitleLabel) &&
                (constraint.firstAnchor == sut.headTitleLabel.leadingAnchor) &&
                ((constraint.secondItem as? UILayoutGuide) == sut.view.safeAreaLayoutGuide) &&
                (constraint.secondAnchor == sut.view.safeAreaLayoutGuide.leadingAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 16.5 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasLeadingConstraint)
    }
    
    func testHeadTitleLabelHasTrailingConstraint(){
        let hasTrailingConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UILabel) == sut.headTitleLabel) &&
                (constraint.firstAnchor == sut.headTitleLabel.trailingAnchor) &&
                ((constraint.secondItem as? UILayoutGuide) == sut.view.safeAreaLayoutGuide) &&
                (constraint.secondAnchor == sut.view.safeAreaLayoutGuide.trailingAnchor) &&
                (constraint.relation == .lessThanOrEqual) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == -16.5 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasTrailingConstraint)
    }
    
    func testCollectionViewHasTopConstraint(){
        let hasTopConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UICollectionView) == sut.collectionView) &&
                (constraint.firstAnchor == sut.collectionView.topAnchor) &&
                ((constraint.secondItem as? UILabel) == sut.headTitleLabel) &&
                (constraint.secondAnchor == sut.headTitleLabel.bottomAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 33 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasTopConstraint)
    }
    
    func testCollectionViewHasLeadingConstraint(){
        let hasLeadingConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UICollectionView) == sut.collectionView) &&
                (constraint.firstAnchor == sut.collectionView.leadingAnchor) &&
                ((constraint.secondItem as? UILayoutGuide) == sut.view.safeAreaLayoutGuide) &&
                (constraint.secondAnchor == sut.view.safeAreaLayoutGuide.leadingAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 16.5 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasLeadingConstraint)
    }
    
    func testCollectionViewHasBottomConstraint(){
        let hasBottomConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UICollectionView) == sut.collectionView) &&
                (constraint.firstAnchor == sut.collectionView.bottomAnchor) &&
                ((constraint.secondItem as? UIButton) == sut.chooseButton) &&
                (constraint.secondAnchor == sut.chooseButton
                    .topAnchor) &&
                (constraint.relation == .greaterThanOrEqual) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == -18 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasBottomConstraint)
    }
    
    func testCollectionViewHasTrailingConstraint(){
        let hasTrailingConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UICollectionView) == sut.collectionView) && (constraint.firstAnchor == sut.collectionView.trailingAnchor) && (constraint.secondItem as? UILayoutGuide) == sut.view.safeAreaLayoutGuide && (constraint.secondAnchor == sut.view.safeAreaLayoutGuide.trailingAnchor) && (constraint.relation == .equal) && constraint.multiplier == 1.0 && constraint.constant == -16.5 && constraint.isActive == true
        }
        XCTAssertTrue(hasTrailingConstraint)
    }
    
    func testChooseButtonHasLeadingConstraint(){
        let hasLeadingConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UIButton) == sut.chooseButton) && (constraint.firstAnchor == sut.chooseButton.leadingAnchor) && (constraint.secondItem as? UILayoutGuide) == sut.view.safeAreaLayoutGuide && (constraint.secondAnchor == sut.view.safeAreaLayoutGuide.leadingAnchor) && (constraint.relation == .equal) && constraint.multiplier == 1.0 && constraint.constant == 16 && constraint.isActive == true
        }
        XCTAssertTrue(hasLeadingConstraint)
    }
    
    func testChooseButtomHasBottomConstraint(){
        let hasBottomConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UIButton) == sut.chooseButton) && (constraint.firstAnchor == sut.chooseButton.bottomAnchor) && (constraint.secondItem as? UILayoutGuide) == sut.view.safeAreaLayoutGuide && (constraint.secondAnchor == sut.view.safeAreaLayoutGuide.bottomAnchor) && (constraint.relation == .equal) &&  constraint.multiplier == 1.0 && constraint.constant == -16 && constraint.isActive == true
        }
        XCTAssertTrue(hasBottomConstraint)
    }
    
    func testChooseButtonHasTrailingConstraint(){
        let hasTrailingConstraint = sut.view.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UIButton) == sut.chooseButton) && (constraint.firstAnchor == sut.chooseButton.trailingAnchor) && (constraint.secondItem as? UILayoutGuide) == sut.view.safeAreaLayoutGuide && (constraint.secondAnchor == sut.view.safeAreaLayoutGuide.trailingAnchor) && (constraint.relation == .equal) &&  constraint.multiplier == 1.0 && constraint.constant == -17 && constraint.isActive == true
        }
        XCTAssertTrue(hasTrailingConstraint)
    }
}

