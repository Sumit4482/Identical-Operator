import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var persons: [Person] = []
    var selectedPersons: [Person] {
        return persons.filter { $0.isSelected }
    }
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create three Person objects
        let person1 = Person(name: "Sumit", age: 22, id: 1)
        let person2 = Person(name: "Mohit", age: 30, id: 2)
        let person3 = person1 // Same instance as person1
        
        persons = [person1, person2, person3]
        
        setupUI()
    }
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PersonCell.self, forCellReuseIdentifier: "PersonCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [tableView])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalToConstant: 200),
            tableView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
        cell.person = persons[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPerson = persons[indexPath.row]
        selectedPerson.isSelected.toggle()
        tableView.reloadData()
    }
}
