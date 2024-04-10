//
//  DownloadManager.swift
//  PlantApp
//
//  Created by Aeliana Shen on 4/5/24.
//

import Foundation

class DownloadManager: NSObject, URLSessionDownloadDelegate {
    private var downloadProgress: Progress?
    private var progressHandler: ((Double) -> Void)?
    private var plant: String?
    
    func downloadFileAsync(url: URL, plant: String, progressHandler: @escaping (Double) -> Void) async throws {
        let downloadProgress = Progress(totalUnitCount: 100)
        self.downloadProgress = downloadProgress
        self.progressHandler = progressHandler
        self.plant = plant
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let downloadTask = session.downloadTask(with: url)
        downloadTask.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let destinationURL = getPathForFile(name: plant!) else {
            print("Error: Unable to get destination URL")
            return
        }
        
        do {
            try FileManager.default.moveItem(at: location, to: destinationURL)
            print("File moved to: \(destinationURL)")
        } catch {
            print("Error moving file: \(error)")
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let fractionCompleted = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        downloadProgress?.completedUnitCount = Int64(fractionCompleted * 100)
        
        DispatchQueue.main.async {
            self.progressHandler?(fractionCompleted)
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
