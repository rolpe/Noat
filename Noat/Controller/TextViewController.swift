//
//  TextViewController.swift
//  Noat
//
//  Created by Ron Lipkin on 7/22/18.
//  Copyright © 2018 Ron Lipkin. All rights reserved.
//

import UIKit
import CoreData

class TextViewController: UIViewController, UITextViewDelegate {
    
    var note: Note?
    @IBOutlet weak var noteText: UITextView!
    @IBOutlet weak var navTitle: UINavigationItem!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        noteText.delegate = self
        noteText.text = note?.text
        navTitle.title = note?.title
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        saveItems()
    }

    //MARK - Data Manipulation Methods
    func saveItems() {
        note?.text = noteText.text
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        saveItems()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
