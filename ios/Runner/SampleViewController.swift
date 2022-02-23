//
//  SampleViewController.swift
//  Runner
//
//  Created by Jaime Jazareno III on 2/18/22.
//

import Flutter
import UIKit
import SwiftUI

class SampleViewController: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(withFrame frame: CGRect,
                viewIdentifier viewId: Int64,
                arguments args: Any?) -> FlutterPlatformView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

private class FLNativeView: NSObject, FlutterPlatformView {
    init(frame: CGRect,
         viewIdentifier viewId: Int64,
         arguments args: Any?,
         binaryMessenger messenger: FlutterBinaryMessenger?) {
        super.init()
    }

    func view() -> UIView {
        let child = UIHostingController(rootView: FLNNewNativeView())
        return child.view
    }
}

private struct FLNNewNativeView: View {
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            Text("Sample App")
        }
    }
}
