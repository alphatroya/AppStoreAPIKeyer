//
// Copyright © 2020 Alexey Korolev <alphatroya@gmail.com>
//

import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(AppStoreAPIKeyerTests.allTests),
        ]
    }
#endif
