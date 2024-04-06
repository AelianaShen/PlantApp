//
//  DownloadManager.swift
//  PlantApp
//
//  Created by Aeliana Shen on 4/5/24.
//

import Foundation
class DownloadManager {
    private var downloadProgress: Progress?
    
    func downloadFileAsync(url: URL, destinationURL: URL) async throws -> URL {
        let (tempLocalURL, _) = try await URLSession.shared.download(from: url)
        
        try FileManager.default.moveItem(at: tempLocalURL, to: destinationURL)
        
        return tempLocalURL
    }
    
    func startDownload(url: URL, plant: String, progressHandler: @escaping (Double) -> Void) async throws {
        do {
            guard let destinationURL = getPathForFile(name: plant) else {
                throw NSError(domain: "Unable to get directory", code: 0)
            }
            
            if FileManager.default.fileExists(atPath: destinationURL.path) {
                throw NSError(domain: "File already exists", code: 1)
            }
            
            let task = Task { () -> URL in
                self.downloadProgress = Progress(totalUnitCount: 100)
                return try await self.downloadFileAsync(url: url, destinationURL: destinationURL)
            }
            
            Task {
                while let progress = self.downloadProgress, !task.isCancelled && !progress.isFinished {
                    try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
                    progressHandler(progress.fractionCompleted)
                }
                
                if let progress = self.downloadProgress, progress.isFinished {
                    progressHandler(1.0)
                }
            }
            
            let downloadedURL = try await task.value
            print("Download finished: \(downloadedURL)")
        } catch {
            print("Download failed: \(error)")
        }
    }
    
    func getPathForFile(name: String) -> URL? {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("\(name).usdz") else {
            print("Error getting path.")
            return nil
        }
        return path
    }
}

