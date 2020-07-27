//
//  main.swift
//  PavelR_lesson4
//
//  Created by Павел on 26.07.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import Foundation

enum Windows: String {
    case open, close
    
    var windowsState: String {
        switch self {
        case .open: return "Окна открыты"
        case .close: return "Окна закрыты"
        
        }
    }
}
enum CarTransmition: String {
    case manual = "механической", auto = "автоматической"
}

enum CarEngineState: String {
    case started = "запущен", notStarded = "выключен"
}

enum Color: String {
    case yellow = "Желтый ", red = "Красный", black = "Черный", blue = "Синий"
}
class  Car {
    let brand: String
    var color: Color
    let model: String
    let year: Int
    let doors: Int
    let engineType: String
    let engineVolume: Double
   
  
    // открытие и закрытие окон
    var windows: Windows {
        willSet {
            if newValue == .open {
                print("Окна открываютя")
            } else {
                print("Окна закрываются")
            }
        }
    }
    
    let transmition: CarTransmition
    //запуск двигателя
    var engineStatus: CarEngineState {
        willSet {
            if newValue == .started {
            print("Двигатель запускается")
        } else {
            print("Двигатель выключается")
            }
        }
    }
    
    var carMileage: Double
    init(brand: String, color: Color, model: String, year: Int, doors: Int, engineType: String, engineVolume: Double, windows: Windows, transmition: CarTransmition, engineStatus: CarEngineState, carMileage: Double) {
        self.brand = brand
        self.color = color
        self.model = model
        self.year = year
        self.doors = doors
        self.engineType = engineType
        self.engineVolume = engineVolume
        self.windows = windows
        self.transmition = transmition
        self.engineStatus = engineStatus
        self.carMileage = carMileage
    }
   
    
    func printCar() {
        print("Автомобиль марки \(brand) , модель \(model) ,\(color.rawValue) цвет , \(year) года выпуска с \(transmition.rawValue) коробкой передач , с пробегом \(carMileage) км ")
        
    }
    func brush(with color: Color) {
        self.color = color
    }

    func printCarStatus() {
        print("У автомобиля \(brand) \(model) \(windows.windowsState) и \(engineStatus.rawValue) двигатель")
    }
    
    
}

var lexus = Car(brand: "Lexus", color: .black, model: "RX 350", year: 2020, doors: 5, engineType: "Gasoline", engineVolume: 3, windows: .open, transmition: .manual, engineStatus: .notStarded, carMileage: 500)

var toyota = Car(brand: "Toyota", color: .red, model: "Camry", year: 2018, doors: 4, engineType: "Gasoline", engineVolume: 3.5, windows: .close, transmition: .manual, engineStatus: .started, carMileage: 1000)

let garage = [lexus, toyota]

enum Navigation: String {
    case used, notUsed
    
    var navigationStatus: String {
        switch self {
        case .used: return "Навигация включена"
        case .notUsed: return "Навигация не включена"
        
        }
    }
}


class TruckCar: Car {
    var trailer: Double
    var maxLoad: Double
    var navi: Navigation {
           willSet {
               if newValue == .used {
                   print("Навигация включается")
               } else {
                   print("Навигация выключается")
               }
           }
       }
    
    init(brand: String, color: Color, model: String, year: Int, doors: Int, engineType: String, engineVolume: Double, windows: Windows, transmition: CarTransmition, engineStatus: CarEngineState, carMileage: Double, trailer: Double, maxLoad: Double, navi: Navigation) {
        
        self.trailer = 0
        self.maxLoad = maxLoad
        self.navi = navi
            
        super.init(brand: brand, color: color, model: model, year: year, doors: doors, engineType: engineType, engineVolume: engineVolume, windows: windows, transmition: transmition, engineStatus: engineStatus, carMileage: carMileage)
    }
    
    func loadTruck(cargo: Double) {
        if (trailer + cargo) <= maxLoad {
            trailer += cargo
            print("осталось места: \(maxLoad - trailer)")
        } else {
            print("Перегруз: свободного места осталось \(maxLoad - trailer)")
        }
    }
    
    override func printCarStatus() {
        print("У автомобиля \(brand) \(model) \(windows.windowsState) , \(engineStatus.rawValue) двигатель , в данный момент \(navi.navigationStatus) , загружено \(trailer) ")
      }
    
}

var kamaz = TruckCar(brand: "KaMaz", color: .yellow, model: "Cargo Truck", year: 2010, doors: 2, engineType: "Дизель", engineVolume: 6.5, windows: .open, transmition: .manual, engineStatus: .notStarded, carMileage: 200, trailer: 0, maxLoad: 4000, navi: .used)


lexus.printCar()
lexus.windows = .close
lexus.brush(with: .yellow)
lexus.printCar()
lexus.printCarStatus()
lexus.windows = .open
lexus.printCarStatus()
lexus.windows = .open
toyota.printCar()
toyota.printCarStatus()
toyota.windows = .open
toyota.engineStatus = .notStarded
toyota.printCarStatus()
lexus.windows = .open
lexus.printCarStatus()
toyota.engineStatus = .started
toyota.printCarStatus()
kamaz.printCar()
kamaz.windows = .open
kamaz.brush(with: .blue)
kamaz.loadTruck(cargo: 876)
kamaz.printCarStatus()
kamaz.navi = .notUsed
kamaz.printCarStatus()
