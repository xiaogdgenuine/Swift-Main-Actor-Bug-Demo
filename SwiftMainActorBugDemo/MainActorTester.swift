//
// Created by xiaogd on 2022/1/6.
//

import Foundation

@MainActor
class MainActorTester {
    func failedTest() {
        let actor = TestActor()

        Task {
            // Before guard let await, Thread.isMainThread is "true"
            print("Task started ->>> in main thread: \(Thread.isMainThread)")

            guard let result = await actor.result else {
                // After guard let await, Thread.isMainThread is "false"
                print("Task ended ->>> in main thread: \(Thread.isMainThread)")
                return
            }
        }
    }

    func successTest() {
        let actor = TestActor()

        Task {
            print("Task started ->>> in main thread: \(Thread.isMainThread)")

            // Before await, Thread.isMainThread is "true"
            let result = await actor.result

            guard result != nil else {
                // After await, Thread.isMainThread is still "true"
                print("Task ended ->>> in main thread: \(Thread.isMainThread)")
                return
            }
        }
    }
}

actor TestActor {
    var result: Bool? = nil
}

//MainActorTester().failedTest()
//MainActorTester().successTest()