# Azure Blob CLI

A simple command-line interface tool for listing blobs in an Azure Storage container using a SAS URL. It uses the [AzureStorageSwift](https://github.com/oliwonders/AzureStorageSwift) library for blob interaction.

## Features

- List blobs in an Azure Storage container using a SAS URL
- Simple command-line interface

## Prerequisites

- macOS 11.0 or later
- Swift 5.7 or later
- Xcode (for development)

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd AzureBlobCLI
```

2. Update the placeholder in main.swift with your Azure storage SAS url 

```swift
let sasUrl = "https://sample.blob.core.windows.net/shared?sp=racwdl&st=2025-02-17T20:21:43Z&se=2026-01-02T04:21:43Z&spr=https&sv=2022-11-02&sr=c&sig=xxx"
```

3. Build the project:
```bash
swift build
```

## Usage

Run the CLI tool:

```bash
swift run
```

The tool will list all blobs in the specified container.

### Example Output

```
Attempting to connect to Azure Blob Storage...
     Storage Account: sample.blob.core.windows.net
     Container:       myfiles
Initializing az storage container...
Blobs in container:
 - document1.pdf
 - image.jpg
 - data.json
```

## Dependencies

- [AzureStorageSwift](https://github.com/oliwonders/AzureStorageSwift.git) - Swift library for Azure Storage operations

## Development

The project is structured as follows:

- `Package.swift` - Swift package manifest
- `Sources/AzureBlobCLI/main.swift` - CLI entry point
- `Sources/AzureBlobLister/AzureBlobLister.swift` - Core functionality
