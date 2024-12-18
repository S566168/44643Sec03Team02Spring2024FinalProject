import UIKit
import AudioToolbox

class Picker: UIViewController {
    var stringArray: [String]!
    var onDone: ((Int) -> Void)?
    var onCancel: (() -> Void)?
    let pickerView = UIPickerView()
    let toolBar = UIToolbar()
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    
    var doneButton: UIBarButtonItem!
    var cancelButton: UIBarButtonItem!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.backgroundColor = .clear
        doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        doneButton.tintColor = .black
        let attributedDoneTitle = NSAttributedString(
            string: "Done",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
                NSAttributedString.Key.foregroundColor: UIColor.black // You can set your desired color here
            ]
        )
        let doneCustomButton = UIButton()
        doneCustomButton.setAttributedTitle(attributedDoneTitle, for: .normal)
        doneCustomButton.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        doneButton.customView = doneCustomButton

        cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        cancelButton.tintColor = .black

        toolBar.setItems([cancelButton, flexibleSpace, doneButton], animated: false)
        pickerView.frame = CGRect(x: 0, y: view.frame.height - 230, width: view.frame.width, height: 230)
        toolBar.frame = CGRect(x: 0, y: view.frame.height - 230 - 44, width: view.frame.width, height: 44)
        toolBar.backgroundColor = .clear
        pickerView.backgroundColor = .black
        
    }

    @objc func doneTapped() {
        onDone?(pickerView.selectedRow(inComponent: 0))
        dismiss(animated: true, completion: nil)
    }

    @objc func cancelTapped() {
        onCancel?()
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            
        pickerView.dataSource = self
        pickerView.delegate = self
        view.backgroundColor = .clear

        let attributedDoneTitle = NSAttributedString(
               string: "Done",
               attributes: [
                  NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
                   NSAttributedString.Key.foregroundColor: UIColor.black
               ]
        )
    
    
           let doneCustomButton = UIButton()
           doneCustomButton.setAttributedTitle(attributedDoneTitle, for: .normal)
           doneCustomButton.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)

        cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        cancelButton.tintColor = .black
       
        doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        
        doneButton.customView = doneCustomButton

        doneButton.tintColor = .black
        toolBar.setItems([cancelButton, flexibleSpace, doneButton], animated: false)

        
        view.addSubview(pickerView)
        view.addSubview(toolBar)
    }
}

extension Picker: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stringArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stringArray[row]
    }
}

 
