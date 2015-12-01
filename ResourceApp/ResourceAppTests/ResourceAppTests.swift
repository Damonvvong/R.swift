//
//  ResourceAppTests.swift
//  ResourceAppTests
//
//  Created by Mathijs Kadijk on 20-07-15.
//  Copyright (c) 2015 Mathijs Kadijk. All rights reserved.
//

import UIKit
import XCTest
@testable import ResourceApp

class ResourceAppTests: XCTestCase {

  let expectedWarnings = [
    "warning: [R.swift] Skipping 2 images because symbol 'second' would be generated for all of these images: Second, second",
    "warning: [R.swift] Skipping 2 xibs because symbol 'duplicate' would be generated for all of these xibs: Duplicate, duplicate",
    "warning: [R.swift] Skipping 2 storyboards because symbol 'duplicate' would be generated for all of these storyboards: Duplicate, duplicate",
    "warning: [R.swift] Skipping 2 reuseIdentifiers because symbol 'duplicateCellView' would be generated for all of these reuseIdentifiers: DuplicateCellView, duplicateCellView",
    "warning: [R.swift] Skipping 2 segues for 'SecondViewController' because symbol 'toThird' would be generated for all of these segues: toThird, toThird",
  ]
  
  func testLoggedWarnings() {
    guard let logURL = NSBundle(forClass: ResourceAppTests.self).URLForResource("rswift", withExtension: "log") else {
      XCTFail("File rswift.log not found")
      return
    }

    do {
      let logContent = try String(contentsOfURL: logURL)
      let logLines = logContent.componentsSeparatedByString("\n")

      for warning in expectedWarnings {
        XCTAssertTrue(logLines.contains(warning), "Warning is not logged: '\(warning)'")
      }

    } catch {
      XCTFail("Failed to read rswift.log")
    }
  }

}
