import XCTest

import TuringTests

var tests = [XCTestCaseEntry]()
tests += TuringTests.allTests()
XCTMain(tests)
