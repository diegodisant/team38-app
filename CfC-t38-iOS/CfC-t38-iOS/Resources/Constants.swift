//
//  Constants.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import UIKit

struct Constants {
    struct Colors {
        static let statusGreen = UIColor.init(red: 98/255, green: 156/255, blue: 68/255, alpha: 1.0)
        static let statusRed = UIColor.init(red: 255/255, green: 56/255, blue: 35/255, alpha: 1.0)
        static let buttonRed = UIColor.init(red: 248/255, green: 95/255, blue: 106/255, alpha: 1.0)
    }
    struct StatusParagraph {
        static let positive = "Quiere decir que estás infectado, nosotros estaremos al pendiente de tu salud. Recuerda contestar nuestras preguntas diarias"
        static let negative = "Quiere decir que estás listo para salir. Recuerda usar medidas de prevención y lavarte las manos frecuentemente."
    }
}
