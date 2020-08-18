import Foundation
import Branch

class BranchService {
    func generateShortUrl(params: [AnyHashable : Any], linkProperties: BranchLinkProperties, completion: @escaping (String?, Error?)->(Void)) -> Void {
        Branch.getInstance().getShortUrl(withParams: params, andTags: linkProperties.tags, andAlias: linkProperties.alias, andMatchDuration: linkProperties.matchDuration, andChannel: linkProperties.channel, andFeature: linkProperties.feature, andStage: linkProperties.stage, andCampaign: linkProperties.campaign) { (url, error) in
            if (error == nil) {
                completion(url, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
