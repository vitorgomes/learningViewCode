//
//  ViewController.swift
//  learningViewCode
//
//  Created by Vitor Gomes on 12/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     3 regras principais para quando se trabalha com ViewCode:
     
         1º - Criar o elemento
         2º - Adicionar na sua View
         3º - Adicionar a regra de Auto Layout
     */
    
    // 1º - Criar o elemento
    // Criando um botão de exemplo, será criado so na hora que for usado por conta do lazy. Usando como referência o tutorial https://www.youtube.com/watch?v=4qxm486j9SE
    lazy var button:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Teste", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 4
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(self.tappedButton(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    // Criando uma ação para o botão fazer
    @objc func tappedButton(sender:UIButton){
        print("Botao apertado")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Testando se funcionou as primeiras configurações de ViewCode
        view.backgroundColor = .red
        
        //2º - Adicionar na sua View
        self.view.addSubview(self.button)
        
        self.configConstraints()
    }

    //3º - Adicionar a regra de Auto Layout
    private func configConstraints(){
        NSLayoutConstraint.activate([
            //Eixo X e Y identicos ao da SuperView
            self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            // Leading e Trailing vão ser os mesmos da View porém com a adição/subtração da constant
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }

}

