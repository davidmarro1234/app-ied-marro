//
//  DettaglioEventoController.swift
//  David Marro
//
//  Created by David Marro on 06/05/2019.
//  Copyright © 2019 David Marro. All rights reserved.
//

import UIKit

class DettaglioEventoController: UIViewController,
UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//questo è l evento da rappresentare sulla schermata.
    
    var evento: Evento?
    
    @IBOutlet weak var imageCopertina: UIImageView!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var labelPrezzo: UILabel!
    
    @IBOutlet weak var labelIndirizzo: UILabel!
    
    @IBOutlet weak var labelDescrizione: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        metto i contenuti dell evento sui componenti della schermata
        // Do any additional setup after loading the view.
        if let eventoDaRappresentare = evento {
            setupConEvento(eventoDaRappresentare)
        }
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    
    
    
    func setupConEvento(_ evento: Evento){
//        metto il nome dell evento
        labelNome.text = evento.nome
        
        labelIndirizzo.text = evento.indirizzo
        
        if let prezzo = evento.prezzo, prezzo > 0.0 {
            labelPrezzo.text = String(format: "%.f € l'ora",prezzo)
        }
        else
        {
            //        nessun prezzo specificato
            labelPrezzo.text = "Gratis"
            
        }

        
        labelDescrizione.text = evento.descrizione
//      metto l immagine dell evento
        
        NetworkUtility.downloadImmagine(indirizzoWeb: evento.copertinaUrl, perImageView: imageCopertina)
    }
    
    //    MARK: - CollectionView delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        il numero di celle che deve disegnare la collecion view
        return evento?.oggettiAcquistabili?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cella = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOggettoAcquistabileCollectionViewCell", for: indexPath) as! CellOggettoAcquistabileCollectionViewCell
        
        let oggetto = evento?.oggettiAcquistabili?[indexPath.item]
        
        cella.setupConOggettoAcquistabile(oggetto)
        
        return cella
    }
    
    //     MARK: - CollectionView layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let altezza =  collectionView.frame.size.height
        
//        larghezza
        
        let larghezzaTotale = collectionView.frame.size.width
        let larghezza = larghezzaTotale * 0.7
        
        return CGSize(width: larghezza, height: altezza)
        
        
    }
}
