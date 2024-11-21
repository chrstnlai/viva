//
//  Camera.swift
//  viva
//
//  Created by Christine Lai on 11/20/24.
//

import SwiftUI
import PhotosUI

struct Camera: View {
    @State private var showingCamera = false
    @State private var images: [UIImage] = [] // Gallery to store taken pictures
    
    var body: some View {
        NavigationView {
            VStack {
                // Camera Button
                Button(action: {
                    showingCamera = true
                }) {
                    Text("Get Rewards")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showingCamera) {
                    CameraView(images: $images)
                }
                .padding()
                
                // Gallery View
                if images.isEmpty {
                    Text("No pictures yet")
                        .foregroundColor(.gray)
                        .italic()
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(images, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .clipped()
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Garden Cafe")
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CameraView: UIViewControllerRepresentable {
    @Binding var images: [UIImage]
    @Environment(\.presentationMode) var presentationMode
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraView
        
        init(parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.images.append(image) // Add the taken picture to the gallery
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}


#Preview{
    Camera()
}
