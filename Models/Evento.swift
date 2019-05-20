//
//  Evento.swift
//  David Marro
//
//  Created by David Marro on 08/04/2019.
//  Copyright © 2019 David Marro. All rights reserved.
//

import UIKit

class Evento: NSObject {
    
    var id: Int?
    
    var nome: String?
    var descrizione: String?
    var indirizzo: String?
    var data: Date?
    var prezzo: Float?
    var copertinaUrl: String?

    var oggettiAcquistabili: [OggettoAcquistabile]?
}
