import XCTest
import Capacitor
import Branch
@testable import Plugin

class PluginTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGetStandardEvents() {
        let plugin = BranchDeepLinks()

        let call = CAPPluginCall(callbackId: "getStandardEvents", success: { (result, _) in
            let resultValue = result!.data["branch_standard_events"] as? [Any]
            let containsEvents = resultValue!.contains { element in
                if (element as? BranchStandardEvent) != nil {
                    return true
                } else {
                    return false
                }
            }
            XCTAssertTrue(containsEvents)
        }, error: { (_) in
            XCTFail("Error shouldn't have been called")
        })

        plugin.getStandardEvents(call!)
    }

    func testGenerateShortUrl() {
        let plugin = BranchDeepLinks()
        plugin.setBranchService(branchService: BranchServiceMock())
        let analytics = ["channel": "facebook"]
        let properties = ["$desktop_url": "http://www.example.com/desktop"]

        let call = CAPPluginCall(callbackId: "generateShortUrl", options: [
            "analytics": analytics,
            "properties": properties
        ], success: { (result, _) in
            let resultValue = result!.data["url"] as? String
            XCTAssertEqual(resultValue, "https://example.app.link/qeFky9V118")
        }, error: { (_) in
            XCTFail("Error shouldn't have been called")
        })

        plugin.generateShortUrl(call!)
    }
}
