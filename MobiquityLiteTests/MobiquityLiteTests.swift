//
//  MobiquityLiteTests.swift
//  MobiquityLiteTests
//
//  Created by Koushal, KumarAjitesh on 2019/11/21.
//  Copyright © 2019 Koushal, KumarAjitesh. All rights reserved.
//

import XCTest
@testable import MobiquityLite

private let photos = Photo(id: "41886638322",
                           owner: "151109375",
                           secret: "9e692e7e1d",
                           server: "959",
                           farm: 1,
                           title: "Alice and Bob",
                           ispublic: 1,
                           isfriend: 0,
                           isfamily: 0)
private let photosModel = PhotosClass(page: 1,
                                      pages: 4,
                                      perpage: 20,
                                      total: "50",
                                      photo: [photos])

//class MockApiService: Router {
//    var isFetchPopularPhotoCalled = false
//    var completeClosure: (([PhotosClass], Router.Result<Any>, Error) -> ())
//    var decodeClosure: ((Router.Result<Any>) -> ())
//
//    func requestFor<T>(text: String, with pageCount: String, decode: @escaping (Codable) -> T?, completionHandler: @escaping(Result<T>) -> Void){
//        isFetchPopularPhotoCalled = true
//        completeClosure = completionHandler
//    }
//
//    func fetchSuccess() {
//        completeClosure(
//    }
//
//    func fetchFail(error: Error?) {
//        completeClosure( false, [Photo](), error )
//    }
//}

class MobiquityLiteTests: XCTestCase {
    
    fileprivate var router: Router?
    
    override func setUp() {
        super.setUp()
        self.router = Router()
    }
    
    override func tearDown() {
        self.router = nil
        super.tearDown()
    }
    
    func test_ControllerHasCollectionView() {
        guard let controller = UIStoryboard(name: "Main", bundle: Bundle(for: SearchController.self)).instantiateViewController(withIdentifier: "SearchController") as? SearchController else {
            return XCTFail("Could not instantiate Search Controller from main storyboard")
        }
        
        controller.loadViewIfNeeded()
        
        XCTAssertNotNil(controller.collectionResult,
                        "Controller should have a collectionView")
    }
    
    func test_collectionViewConformsToCollectionViewDataSourceProtocol() {
        guard let controller = UIStoryboard(name: "Main", bundle: Bundle(for: SearchController.self)).instantiateViewController(withIdentifier: "SearchController") as? SearchController else {
            return XCTFail("Could not instantiate SwipingWeatherDetailViewController from main storyboard")
        }
        XCTAssertTrue(controller.conforms(to: UICollectionViewDataSource.self))
    }
}
