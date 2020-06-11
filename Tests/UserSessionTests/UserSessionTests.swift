import XCTest
@testable import UserSession

final class UserSessionTests: XCTestCase {
    
    lazy var appDIContainer = AppDIContainer()
    
    func testUserSession() -> UserSession {
        let userSubscriptions: [UserSubscriptions] = []
        let profile: Profile = Profile(name: "Ali Fakih", email: "afdetails@gmail.com", mobileNumber: "96176408484", avatar: "", products: userSubscriptions)
        let deeplinkSpecs: DeeplinkUserSession = DeeplinkUserSession()
        let userSession: UserSession = UserSession(profile: profile, deeplinkUserSession: deeplinkSpecs)
        userSession.logSession()
        return userSession
    }
    
    func testSaveUserSession() {
        let userSession = testUserSession()
        let expectation = self.expectation(description: "Should return UserSession")
        expectation.expectedFulfillmentCount = 1
        _ = appDIContainer.makeUserSessionDataStorageRepository().saveUserSession(userSession: userSession) { result in
            switch result {
            case .success(let readUS):
                XCTAssertEqual(userSession, readUS)
                readUS?.logSession()
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testReadSession() {
        let expectation = self.expectation(description: "Should match the result of testSaveUserSession")
        _ = appDIContainer.makeUserSessionDataStorageRepository().readUserSession(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let session):
                XCTAssertEqual(self.testUserSession(), session)
                expectation.fulfill()
                break
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        })
        
        wait(for: [expectation], timeout: 3)
    }
    
    
    func testUpdateSession() {
        let expectation = self.expectation(description: "Should match the updated User Session ")
        let userSession = UserSession(profile:
            Profile(name: "Mike", email: "mike@gmail.com", mobileNumber: "881200432", avatar: "", products: []),
                                      deeplinkUserSession: DeeplinkUserSession())
        _ = appDIContainer.makeUserSessionDataStorageRepository().updateUserSession(userSession: userSession, completion: { result in
            switch result {
            case .success(let session):
                XCTAssertEqual(session, userSession)
                expectation.fulfill()
                break
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
                break
            }
        })
        wait(for: [expectation], timeout: 2)
    }
    
    func testDeleteUserSession() {
        let expectation = self.expectation(description: "Should return nil object")
        _ = appDIContainer.makeUserSessionDataStorageRepository().deleteUserSession(completion: { result in
            switch result {
            case .success(let session):
                XCTAssertNil(session)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        })
        wait(for: [expectation], timeout: 1)
    }
    

    static var allTests = [
        ("testUserSession", testUserSession),
        ("testSaveUserSession" , testSaveUserSession),
        ("testReadSession", testReadSession),
        ("testUpdateSession",testUpdateSession),
        ("testDeleteUserSession",testDeleteUserSession)
        ] as [Any]
}
