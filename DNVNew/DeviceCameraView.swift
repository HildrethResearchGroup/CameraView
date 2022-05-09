//
//  DeviceCameraView.swift
//  DNVNew
//
//  Created by Connor Barnes on 5/9/22.
//

import SwiftUI
import AVFoundation

struct DeviceCameraView: NSViewControllerRepresentable {
	@Binding var device: AVCaptureDevice?
	
	typealias NSViewControllerType = CameraViewController
	
	func makeNSViewController(context: Context) -> CameraViewController {
		return CameraViewController()
	}
	
	func updateNSViewController(_ nsViewController: CameraViewController, context: Context) {
		nsViewController.device = device
	}
}
