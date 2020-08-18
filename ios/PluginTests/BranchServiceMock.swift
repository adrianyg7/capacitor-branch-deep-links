import Foundation
import Branch
@testable import Plugin

class BranchServiceMock: BranchService {
    override func generateShortUrl(params: [AnyHashable : Any], linkProperties: BranchLinkProperties, completion: @escaping (String?, Error?)->(Void)) -> Void {
        completion("https://example.app.link/qeFky9V118", nil)
    }
}
