//
//  ProposalCellTest.swift
//  ProposalAvitoTests
//
//  Created by Rotach Roman on 09.01.2021.
//

import XCTest
@testable import ProposalAvito

class ProposalCellTest: XCTestCase {
    
    var cell: ProposalCell!

    override func setUpWithError() throws {
        let sut = ProposalViewController()
        sut.loadViewIfNeeded()
        
        let collectionView = sut.collectionView
        cell = collectionView?.dequeueReusableCell(withReuseIdentifier: String(describing: ProposalCell.self), for: IndexPath(row: 0, section: 0)) as? ProposalCell
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        cell = nil
    }
    
    //MARK: - Properties elments
    func testHasTitleLabel(){
        XCTAssertNotNil(cell.titleLabel)
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
    }
    
    func testHasDescriptionLabel(){
        XCTAssertNotNil(cell.descriptionLabel)
        XCTAssertTrue(cell.descriptionLabel.isDescendant(of: cell.contentView))
    }
    
    func testPriceLabel(){
        XCTAssertNotNil(cell.priceLabel)
        XCTAssertTrue(cell.priceLabel.isDescendant(of: cell.contentView))
    }
    
    func testIconImageView(){
        XCTAssertNotNil(cell.iconImageView)
        XCTAssertTrue(cell.iconImageView.isDescendant(of: cell.contentView))
    }
    
    func testHasMarkImageView(){
        XCTAssertNotNil(cell.markImageView)
        XCTAssertTrue(cell.markImageView.isDescendant(of: cell.contentView))
    }
    
    func testTitleLabelHasDynamicLenght(){
        XCTAssertEqual(cell.titleLabel.numberOfLines, 0)
    }
    
    func testDescriptionLabelHasDynamicLenght(){
        XCTAssertEqual(cell.descriptionLabel.numberOfLines, 0)
    }
    
    func testTitleLabelTranslatesAutoresizingMaskIntoConstraintsFalse(){
        XCTAssertFalse(cell.titleLabel.translatesAutoresizingMaskIntoConstraints)
    }
    
    func testDescriptionLabelTranslatesAutoresizingMaskIntoConstraintsFalse(){
        XCTAssertFalse(cell.descriptionLabel.translatesAutoresizingMaskIntoConstraints)
    }
    
    func testPriceLabelTranslatesAutoresizingMaskIntoConstraintsFalse(){
        XCTAssertFalse(cell.priceLabel.translatesAutoresizingMaskIntoConstraints)
    }
    
    func testIconImageViewTranslatesAutoresizingMaskIntoConstraintsFalse(){
        XCTAssertFalse(cell.iconImageView.translatesAutoresizingMaskIntoConstraints)
    }
    
    func testMarkImageViewTranslatesAutoresizingMaskIntoConstraintsFalse(){
        XCTAssertFalse(cell.markImageView.translatesAutoresizingMaskIntoConstraints)
    }
    
    //MARK: - Init
    func testInitCancelImageWithTrueName() {
        let image = UIImage(named: "checkmark")
        XCTAssertNotNil(image)
        XCTAssertEqual(image, cell.markImageView.image)
    }
    
    func testConfigureSetsTitle() {
        let proposal = Proposal(title: "Foo", price: "100")
        
        cell.configure(withProposal: proposal)
        XCTAssertEqual(cell.titleLabel.text, "Foo")
    }
    
    func testConfigureSetsPrice() {
        let proposal = Proposal(title: "Foo", price: "100 Р")
        
        cell.configure(withProposal: proposal)
        XCTAssertEqual(cell.priceLabel.text, "100 Р")
    }
    
    func testConfigureSetsDescription() {
        let proposal = Proposal(title: "Foo", description: "Baz", price: "100")
        
        cell.configure(withProposal: proposal)
        XCTAssertEqual(cell.descriptionLabel.text, "Baz")
    }
    
    func testConfigureSetsIconImageNotNil() {
        let icon = IconProposal(the52X52: "https://www.avito.ru/s/common/components/monetization/icons/apps/vas-xl-52.png")
        let proposal = Proposal(title: "Foo", description: "Baz", price: "100", icon: icon)

        cell.configure(withProposal: proposal)
        let expectation = XCTestExpectation(description: "testExample")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            XCTAssertNotNil(self.cell.iconImageView.image)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.5)
    }
    //MARK: - Constraints
    
    func testIconImageViewHasTopConstraint(){
        let hasTopConstraint = cell.contentView.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UIImageView) == cell.iconImageView) &&
                (constraint.firstAnchor == cell.iconImageView.topAnchor) &&
                ((constraint.secondItem as? UILayoutGuide) == cell.contentView.safeAreaLayoutGuide) &&
                (constraint.secondAnchor == cell.contentView.safeAreaLayoutGuide.topAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 17 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasTopConstraint)
    }
    
    func testIconImageViewHasLeadingConstraint(){
        let hasLeadingConstraint = cell.contentView.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UIImageView) == cell.iconImageView) &&
                (constraint.firstAnchor == cell.iconImageView.leadingAnchor) &&
                ((constraint.secondItem as? UILayoutGuide) == cell.contentView.safeAreaLayoutGuide) &&
                (constraint.secondAnchor == cell.contentView.safeAreaLayoutGuide.leadingAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 17 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasLeadingConstraint)
    }
    
    func testMarkImageViewHasTopConstraint(){
        let hasTopConstraint = cell.contentView.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UIImageView) == cell.markImageView) &&
                (constraint.firstAnchor == cell.markImageView.topAnchor) &&
                ((constraint.secondItem as? UILayoutGuide) == cell.contentView.safeAreaLayoutGuide) &&
                (constraint.secondAnchor == cell.contentView.safeAreaLayoutGuide.topAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 34 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasTopConstraint)
    }
    
    func testMarkImageViewHasTrailingConstraint(){
        let hasTraingConstraint = cell.contentView.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UIImageView) == cell.markImageView) &&
                (constraint.firstAnchor == cell.markImageView.trailingAnchor) &&
                ((constraint.secondItem as? UILayoutGuide) == cell.contentView.safeAreaLayoutGuide) &&
                (constraint.secondAnchor == cell.contentView.safeAreaLayoutGuide.trailingAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == -15 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasTraingConstraint)
    }
    
    func testTitleLabelHasTopConstraint(){
        let hasTopConstraint = cell.contentView.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UILabel) == cell.titleLabel) &&
                (constraint.firstAnchor == cell.titleLabel.topAnchor) &&
                ((constraint.secondItem as? UILayoutGuide) == cell.contentView.safeAreaLayoutGuide) &&
                (constraint.secondAnchor == cell.contentView.safeAreaLayoutGuide.topAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 16 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasTopConstraint)
    }
    
    func testTitleLabelHasLeadingConstraint(){
        let hasLeadingConstraint = cell.contentView.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UILabel) == cell.titleLabel) &&
                (constraint.firstAnchor == cell.titleLabel.leadingAnchor) &&
                ((constraint.secondItem as? UIImageView) == cell.iconImageView) &&
                (constraint.secondAnchor == cell.iconImageView.trailingAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 16 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasLeadingConstraint)
    }
    
   func testTitleLabelHasTrailingConstraint(){
    let hasTrailingConstraint = cell.contentView.constraints.contains { constraint -> Bool in
        return ((constraint.firstItem as? UILabel) == cell.titleLabel) &&
            (constraint.firstAnchor == cell.titleLabel.trailingAnchor) &&
            ((constraint.secondItem as? UIImageView) == cell.markImageView) &&
            (constraint.secondAnchor == cell.markImageView.leadingAnchor) &&
            (constraint.relation == .lessThanOrEqual) &&
            constraint.multiplier == 1.0 &&
            constraint.constant == -22 &&
            constraint.isActive == true
    }
    XCTAssertTrue(hasTrailingConstraint)
}
    func testDescriptionLabelHasTopConstraint(){
        let hasTopConstraint = cell.contentView.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UILabel) == cell.descriptionLabel) &&
                (constraint.firstAnchor == cell.descriptionLabel.topAnchor) &&
                ((constraint.secondItem as? UILabel) == cell.titleLabel) &&
                (constraint.secondAnchor == cell.titleLabel.bottomAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 8 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasTopConstraint)
    }
    
    func testDescriptionLabelHasLeadingConstraint(){
        let hasLeadingConstraint = cell.contentView.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UILabel) == cell.descriptionLabel) &&
                (constraint.firstAnchor == cell.descriptionLabel.leadingAnchor) &&
                ((constraint.secondItem as? UIImageView) == cell.iconImageView) &&
                (constraint.secondAnchor == cell.iconImageView.trailingAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 16 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasLeadingConstraint)
    }
    
    func testDescriptionLabelHasTrailingConstraint(){
        let hasTrailingConstraint = cell.contentView.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UILabel) == cell.descriptionLabel) &&
                (constraint.firstAnchor == cell.descriptionLabel.trailingAnchor) &&
                ((constraint.secondItem as? UIImageView) == cell.markImageView) &&
                (constraint.secondAnchor == cell.markImageView.leadingAnchor) &&
                (constraint.relation == .lessThanOrEqual) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == -22 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasTrailingConstraint)
    }
    
    func testPriceLabelHasTopConstraint(){
        let hasTopConstraint = cell.contentView.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UILabel) == cell.priceLabel) &&
                (constraint.firstAnchor == cell.priceLabel.topAnchor) &&
                ((constraint.secondItem as? UILabel) == cell.descriptionLabel) &&
                (constraint.secondAnchor == cell.descriptionLabel.bottomAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 14 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasTopConstraint)
    }
    
    func testPriceLabelHasLeadingConstraint(){
        let hasLeadingConstraint = cell.contentView.constraints.contains { constraint -> Bool in
            return ((constraint.firstItem as? UILabel) == cell.priceLabel) &&
                (constraint.firstAnchor == cell.priceLabel.leadingAnchor) &&
                ((constraint.secondItem as? UIImageView) == cell.iconImageView) &&
                (constraint.secondAnchor == cell.iconImageView.trailingAnchor) &&
                (constraint.relation == .equal) &&
                constraint.multiplier == 1.0 &&
                constraint.constant == 16 &&
                constraint.isActive == true
        }
        XCTAssertTrue(hasLeadingConstraint)
    }
    
//    func testPriceLabelHasBottomConstraint(){
//        let hasBottomConstraint = cell.contentView.constraints.contains { constraint -> Bool in
//            return ((constraint.firstItem as? UILabel) == cell.priceLabel) &&
//                (constraint.firstAnchor == cell.priceLabel.bottomAnchor) &&
//                ((constraint.secondItem as? UILayoutGuide) == cell.contentView.safeAreaLayoutGuide) &&
//                (constraint.secondAnchor == cell.contentView.safeAreaLayoutGuide.bottomAnchor) &&
//                (constraint.relation == .equal) &&
//                constraint.multiplier == 1.0 &&
//                constraint.constant == -20 &&
//                constraint.isActive == true
//        }
//        XCTAssertTrue(hasBottomConstraint)
//    }
    
    //it test working
//    func testPriceLabelHasTrailingConstraint(){
//        let hasTrailingConstraint = cell.contentView.constraints.contains { constraint -> Bool in
//            return ((constraint.firstItem as? UILabel) == cell.priceLabel) &&
//                (constraint.firstAnchor == cell.priceLabel.trailingAnchor) &&
//                ((constraint.secondItem as? UIImageView) == cell.markImageView) &&
//                (constraint.secondAnchor == cell.markImageView.leadingAnchor) &&
//                (constraint.relation == .lessThanOrEqual) &&
//                constraint.multiplier == 1.0 &&
//                constraint.constant == -22 &&
//                constraint.isActive == true
//        }
//        XCTAssertTrue(hasTrailingConstraint)
//    }

}
