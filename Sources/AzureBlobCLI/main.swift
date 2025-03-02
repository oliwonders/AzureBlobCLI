import Foundation
import AzureBlobLister

let sasUrl = "https://samplefiles.blob.core.windows.net/myfiles?sp=racwdl&st=2025-02-17T20:21:43Z&se=2026-01-02T04:21:43Z&spr=https&sv=2022-11-02&sr=c&sig=xxxxxxxxxx"

guard let urlComponents = URLComponents(string: sasUrl),
      let host = urlComponents.host,
      let queryItems = urlComponents.queryItems else {
    print("❌ Invalid SAS URL format.")
    exit(1)
}

let containerName = urlComponents.path.trimmingCharacters(in: CharacterSet(charactersIn: "/\\"))
print("Attempting to connect to Azure Blob Storage...")
print("\t Storage Account: \(host)")
print("\t Container:       \(containerName)")

if let blobLister = AzureBlobLister(sasUrl: sasUrl) {
    blobLister.listBlobs { blobs, error in
        if let error = error {
            print("❌ Failed to list blobs: \(error.localizedDescription)")
            exit(1)
        } else {
            print("Blobs in container:")
            blobs?.forEach { print(" - \($0)") }
            exit(0)
        }
    }
} else {
    print("❌ Failed to initialize Azure Blob Lister.")
    exit(1)
}

RunLoop.current.run()
