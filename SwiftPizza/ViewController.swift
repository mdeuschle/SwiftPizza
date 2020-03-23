

import UIKit

class ViewController: UITableViewController {
  private var favoritePizzaLabel: UILabel?
  
  lazy var textField: UITextField! = { [weak self] in
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Enter favorite pizza topping"
    textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    return textField
  }()
  
  @objc func textFieldDidChange(_ textField: UITextField) {
    guard let newText = textField.text else {
      return
    }
    favoritePizzaLabel?.text = "My favorite pizza topping \(newText)"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TextFieldCell")
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LabelCell")
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    if indexPath.row == 0 {
      cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath)
      cell.contentView.addSubview(textField)
      setConstraint(in: cell)
    }else{
      cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
      favoritePizzaLabel = cell.textLabel
      favoritePizzaLabel?.text = "My favorite pizza topping \("")"
    }
    return cell
  }
  
  private func setConstraint(in cell: UITableViewCell) {
    NSLayoutConstraint.activate([
        textField.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20),
        textField.topAnchor.constraint(equalTo: cell.topAnchor),
        textField.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20),
        textField.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
    ])
  }
}

