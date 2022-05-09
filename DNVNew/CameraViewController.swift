//
//  CameraViewController.swift
//  DNVNew
//
//  Created by Connor Barnes on 5/9/22.
//

import Cocoa
import AVFoundation

class CameraViewController: NSViewController {
	@IBOutlet weak var cameraView: NSView!
	let session = AVCaptureSession()
	var previewLayer: AVCaptureVideoPreviewLayer!
	var lastInput: AVCaptureInput?
	var device: AVCaptureDevice? {
		didSet {
			if let device = device {
				if let lastInput = lastInput {
					session.removeInput(lastInput)
				}
				
				do {
					lastInput = try AVCaptureDeviceInput(device: device)
					session.addInput(lastInput!)
				} catch {
					lastInput = nil
				}
			} else {
				if let lastInput = lastInput {
					session.removeInput(lastInput)
				}
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		cameraView?.wantsLayer = true
		cameraView?.layer?.backgroundColor = .black
		session.sessionPreset = .medium
		// Preview
		previewLayer = AVCaptureVideoPreviewLayer(session: session)
		previewLayer.frame = cameraView.bounds
		
		previewLayer.videoGravity = .resizeAspect
		cameraView?.layer?.addSublayer(previewLayer)
	}
	
	override func viewDidLayout() {
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		previewLayer.frame = cameraView.bounds
		CATransaction.commit()
	}
	
	override func viewDidAppear() {
		session.startRunning()
	}
	
	override func viewDidDisappear() {
		session.stopRunning()
	}
}
