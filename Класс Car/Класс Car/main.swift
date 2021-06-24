//
//  main.swift
//  Класс Car
//
//  Created by Андрей  on 24.06.2021.
//

import Foundation

enum CarAction {
    case turnEngineOn, turnEngineOff, windowOpen, windowClose
    case enablePnePod, disablePnePod
    case loadTruck, unloadTruck
}

class Car {

    let name: String // марка автомобиля
    var engineRun: Bool = true// запущен ли двигатель
    var openWindow: Bool = false // открыты ли окна
    var fullTrunk: String = "" // полный ли багажник
    


    init (nameAvto: String, engineRunAvto: Bool, openWindowAvto: Bool, fullTrunkAvto: String) {

        self.name = nameAvto
        self.engineRun = engineRunAvto
        self.openWindow = openWindowAvto
        self.fullTrunk = fullTrunkAvto
        



    }
    
    func executeAction( action: CarAction ) {
            switch action {
            case .turnEngineOff:
                guard engineRun else {
                    print("Двигатель уже выключен")
                    return
                }
                
                engineRun = false
                
            case .turnEngineOn:
                guard !engineRun else {
                    print("Двигатель уже включен")
                    return
                }
                
                engineRun = true
                
            case .windowClose:
                guard openWindow else {
                    print("Окна уже закрыты")
                    return
                }
                
                openWindow = false
                
                
            case .windowOpen:
                guard !openWindow else {
                    print("Окна уже открыты")
                    return
                }
                
                openWindow = true
                
            default:
                print("Невозможно выполнить")
                return
            }
        }


}



class sportCar: Car {


    var PnePodEnab: Bool = false //пневмо-подвеска

    override func executeAction(action: CarAction) {
            super.executeAction(action: action)
            switch action {
            case .disablePnePod:
                guard PnePodEnab else {
                    print("Пневмо уже выключена")
                    return
                }
                
                PnePodEnab = false
                
            case .enablePnePod:
                guard !PnePodEnab else {
                    print("Пневмо уже включена")
                    return
                }
                
                PnePodEnab = true
            default:
                print("Действие не поддерживается Porsche")
                return
            }
        }
    }
    




class trunkCar: Car {
    
    var capacityTrunk: Bool = true
    
    override func executeAction(action: CarAction) {
            super.executeAction(action: action)
            switch action {
            case .loadTruck:
                guard capacityTrunk else {
                    print("Кузов полон")
                    return
                }
                
                capacityTrunk = true
                
            case .unloadTruck:
                guard !capacityTrunk else {
                    print("Кузов пуст")
                    return
                }
                
                capacityTrunk = false
            default:
                print("Кузова у этой машины не существует")
                return
            }
        }
    }
    
print(sportCar(nameAvto: "Porsche", engineRunAvto: true, openWindowAvto: true, fullTrunkAvto: "empty"))

print(trunkCar(nameAvto: "Kamaz", engineRunAvto: false, openWindowAvto: false, fullTrunkAvto: "full"))
