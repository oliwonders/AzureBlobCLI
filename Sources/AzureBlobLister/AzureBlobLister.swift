import AzureStorageSwift
import Foundation

public class AzureBlobLister {
    private let container: AZSCloudBlobContainer?

    public init?(sasUrl: String) {
        guard let url = URL(string: sasUrl) else {
            print("❌ Invalid SAS URL")
            return nil
        }
        do {
            print("Initializing az storage container...")
            self.container = try AZSCloudBlobContainer(url: url)
        } catch {
            print(
                "❌ Error initializing container: \(error.localizedDescription)")
            return nil
        }
    }

    public func listBlobs(completion: @escaping ([String]?, Error?) -> Void) {
        guard let container = container else {
            completion(
                nil,
                NSError(
                    domain: "AzureBlobLister", code: 400,
                    userInfo: [NSLocalizedDescriptionKey: "Invalid container"]))
            return
        }
        
        container.listBlobsSegmented(
            with: nil,
            prefix: nil,
            useFlatBlobListing: true,
            blobListingDetails: AZSBlobListingDetails(),
            maxResults: 50
        ) { (error, results) in
            if let error = error {
                            print("❌ Error fetching blobs:")
                                print("Error Domain: \(error._domain)")
                                print("Error Code: \(error._code)")
                                print("Error Details: \(error.localizedDescription)")
                if let nsError = error as NSError? {
                    print("User Info: \(nsError.userInfo)")
                    completion(nil, error)
                    
                }
            } else {
                let blobNames =
                    results?.blobs?.compactMap {
                        ($0 as? AZSCloudBlob)?.blobName
                    } ?? []
                completion(blobNames, nil)
            }
        }
    }
}
