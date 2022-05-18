//
//  Utilities.swift
//  MUXStatsSDKShared
//
//  Created by Stephanie Zuñiga on 14/10/21.
//  Copyright © 2021 Mux, Inc. All rights reserved.
//

import Foundation
import AVFoundation

extension AVPlayerItem {
    var sourceDimensions: CGSize {
        for track in self.tracks {
            // loop until first track with video description
            if let formatDescriptions = track.assetTrack?.formatDescriptions as? [CMFormatDescription] {
                for description in formatDescriptions {
                    var isVideoDescription: Bool {
                        // Remove the conditional if we drop support for iOS < 13.0
                        if #available(iOS 13.0, tvOS 13.0, *) {
                            return description.mediaType == .video
                        } else {
                            return CMFormatDescriptionGetMediaType(description) == kCMMediaType_Video
                        }
                    }
                    
                    if isVideoDescription {
                        // Map video dimensions in pixels
                        var dimensions: CMVideoDimensions {
                            // Remove the conditional if we drop support for iOS < 13.0
                            if #available(iOS 13.0, tvOS 13.0, *) {
                                return description.dimensions
                            } else {
                                return CMVideoFormatDescriptionGetDimensions(description)
                            }
                        }
                        
                        return CGSize(width: Int(dimensions.width), height: Int(dimensions.height))
                    }
                }
            }
        }
        
        return .zero
    }
}
