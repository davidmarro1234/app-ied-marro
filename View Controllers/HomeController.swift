//
//  HomeController.swift
//  David Marro
//
//  Created by David Marro on 08/04/2019.
//  Copyright © 2019 David Marro. All rights reserved.
//

import UIKit

class HomeController: UIViewController,UITableViewDelegate,UITableViewDataSource {

//    la lista di eventi da disegnare sulla TableView
    var listaEventi:[Evento] = []
    
//    MARK - Outlets
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//      serve per comunicare con la table view
        tableView.delegate = self
        tableView.dataSource = self
        creaEventiDiProva()
    }
    
    func creaEventiDiProva(){
        let uno = Evento()
        uno.nome = "Lezione App Design"
        uno.indirizzo = "Via Alcamo 11,Roma,Italia"
        uno.descrizione = "Fantastica lezione di App Design"
        uno.data = dateUtility.data(conStringa: "25/05/2019", formato: "dd/MM/yyyy" )
        uno.prezzo = 55.0
        uno.copertinaUrl = "https://images.unsplash.com/photo-1553531580-652231dae097?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1026&q=80"
        listaEventi.append(uno)
        
        let oggettoUno = OggettoAcquistabile()
        let oggettoDue = OggettoAcquistabile()
        
        
        
        oggettoUno.immagineUrl = "https://images.unsplash.com/photo-1553531580-652231dae097?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1026&q=80"
        oggettoUno.nome = "Lezione App Design"
        oggettoUno.quantita = 2
        oggettoUno.prezzo = 100
        
        oggettoDue.immagineUrl = "https://images.unsplash.com/photo-1542744095-291d1f67b221?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
        oggettoDue.nome = "Special Lesson"
        oggettoDue.quantita = 3
        oggettoDue.prezzo = 7
        
        uno.oggettiAcquistabili = [oggettoUno,oggettoDue]

        let due = Evento()
        due.nome = "Special Lesson"
        due.indirizzo = "Via Alcamo 11,Roma,Italia"
        due.data = dateUtility.data(conStringa: "05/06/2019", formato: "dd/MM/yyyy" )
        due.prezzo = 10.0
        due.copertinaUrl = "https://images.unsplash.com/photo-1542744095-291d1f67b221?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
        listaEventi.append(due)
        
        let tre = Evento()
        tre.nome = "Corso Cucito"
        tre.indirizzo = "Viale Marconi 11,Roma,Italia"
        tre.data = dateUtility.data(conStringa: "03/08/2019", formato: "dd/MM/yyyy" )
        tre.prezzo = 30.0
        tre.copertinaUrl = "https://images.unsplash.com/photo-1556793313-2e9460949ddd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
        listaEventi.append(tre)
    }

    //MARK: - Tableview delegate
//    quanti elementi ci sono
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        in questa funzione l'home controller comunica alla TableView il numero di righe che deve disegnare
        
        return listaEventi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        in questa funzione l'home controller comunica alla table view come deve disegnare ogni riga (con quale UI,con quali dati,ecc....)
        let cella = tableView.dequeueReusableCell(withIdentifier: "CellEvento") as! CellEvento
        
        let evento = listaEventi[indexPath.row]
        cella.setupConEvento(evento)
//        index path dice la riga che stiamo visualizzando
        
        
        
        return cella
    }
//    seleziono l evento per il dettaglio
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let eventoSelezionato = listaEventi[indexPath.row]
        
//        creo la prossima schermata di dettaglio dell'evento
//        1 prendo un riferimento allo storyboard dove risiede il view controller
        let storyboard = UIStoryboard(name: "Main",bundle: nil)
//        2 instanzio il v controller attraverso il suo identifier
                let ViewController = storyboard.instantiateViewController(withIdentifier: "DettaglioEventoController")
//        3 passo l evento selezionato al view controller di dettaglio
        
        if let dettaglioController = ViewController as? DettaglioEventoController{
            dettaglioController.evento = eventoSelezionato
            
        }
        

//        4  apro il view controller di dettaglio
        
        navigationController?.pushViewController(ViewController, animated: true)
    }
}
