# SMPickerView
SMPickerView is a custom PickerView with up/down buttons

# Example

Clone the repo and run the example project. This Example demonstrate how to use the SMPickerView.

# Installation

Drag and drop SMPickerView.swift into your project.

# Usage

### Using Storyboard or xib file:

1. Open a storyboard or xib file.
2. Drag and drop UIView to your UIView, UIViewController,...
3. In Identity inspector, replace the class from UIView with SMPickerView.
4. Add images to your assets file.
5. Create an outlet to SMPickerView.
6. In your code: set the delegate to SMPickerView's outlet and set the pickerData attribute with an array of String.
```
pickerView.delegate = self
pickerView.pickerData = ["Apple", "Banana", "Lemon", "Abricot"]
```

### Using Swift Code:

```
var pickerView = SMPickerView(frame: CGRect(x: 20, y: 20, width: 200, height: 50))
pickerView.delegate = self
pickerView.pickerData = ["Apple", "Banana", "Lemon", "Abricot"]
self.view.addSubview(pickerView)
```
# Author

Sihem MOHAMED
