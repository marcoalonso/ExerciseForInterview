//
//  ViewController.swift
//  Exercise
//
//  Created by Marco Alonso Rodriguez on 05/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableDemo: UITableView!
    
    var manager = Manager()
    
    var tasks : [TaskItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        
        tableDemo.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        tableDemo.delegate = self
        tableDemo.dataSource = self
        
        manager.getItems(urlString: Manager.urlString)
    }


}

extension ViewController: ManagerItemProtocol {
    func showError(with: Error) {
        DispatchQueue.main.async {
            self.mostrarAlerta(titulo: "Warning", mensaje: "An error was found, \(with)")
        }
    }
    
    func getItems(items: [TaskItem]) {
        tasks = items
        DispatchQueue.main.async {
            self.tableDemo.reloadData()
        }
    }
    
    func mostrarAlerta(titulo: String, mensaje: String) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "OK", style: .default) { _ in
            //Do something
        }
        alerta.addAction(accionAceptar)
        present(alerta, animated: true)
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        
        cell.setupUI(item: tasks[indexPath.row])
        
        return cell
    }
    
    
}

