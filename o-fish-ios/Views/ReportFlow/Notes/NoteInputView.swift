//
//  NoteInputView.swift
//
//  Created on 16/04/2020.
//  Copyright © 2020 WildAid. All rights reserved.
//

import SwiftUI

struct NoteInputView: View {

    @ObservedObject var annotatedNote: AnnotatedNoteViewModel
    let noteIndex: Int
    let reportID: String
    var deleteClicked: ((AnnotatedNoteViewModel) -> Void)?

    @State private var showingPhotoTaker = false

    private enum Dimensions {
        static let spacing: CGFloat = 16
        static let textFrameHeight: CGFloat = 100
    }

    var body: some View {
        VStack(spacing: Dimensions.spacing) {
            HStack {
                TitleLabel(title: NSLocalizedString("Note", comment: "") + " \(noteIndex + 1)")
                Button(action: showPhotoTaker) {
                    AddPhotoIconView()
                }
            }
                .padding(.top, Dimensions.spacing)

            InputMultilineField(text: self.$annotatedNote.note)
                .frame(minHeight: Dimensions.textFrameHeight)

            if !annotatedNote.photoIDs.isEmpty {
                PhotoIDsDisplayView(photoIDs: annotatedNote.photoIDs, deletePhoto: deletePhoto)
            }
            SectionButton(title: "Remove Note",
                systemImageName: "minus",
                callingToAction: false,
                action: { self.deleteClicked?(self.annotatedNote) })
                .padding(.bottom, Dimensions.spacing)
        }
    }

    private func showPhotoTaker() {
        PhotoCaptureController.show(reportID: self.reportID) { controller, photoId in
            self.annotatedNote.photoIDs.append(photoId)
            controller.hide()
        }
    }

    private func deletePhoto(photo: PhotoViewModel) {
        annotatedNote.photoIDs.removeAll(where: { $0.id == photo.id })
        photo.delete()
    }
}

struct NoteInputView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NoteInputView(annotatedNote: .sample, noteIndex: 0, reportID: "12345")
            NoteInputView(annotatedNote: .sample, noteIndex: 1, reportID: "12345")
        }
    }
}
