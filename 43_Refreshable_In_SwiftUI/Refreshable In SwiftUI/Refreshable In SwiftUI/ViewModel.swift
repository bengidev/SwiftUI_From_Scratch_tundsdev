//
//  ViewModel.swift
//  Refreshable In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 23/11/23.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published private(set) var animalFamilies: [AnimalFamily] = []
    @Published private(set) var amphibianAnimals: [Animal] = []
    @Published private(set) var mammalAnimals: [Animal] = []
    @Published private(set) var reptileAnimals: [Animal] = []
    @Published private(set) var fishAnimals: [Animal] = []
    @Published private(set) var birdAnimals: [Animal] = []
    @Published private(set) var isLoading: Bool = false
    
    init() {
        self.animalFamilies = [
            AnimalFamily(type: .amphibian, animals: self.amphibianAnimals),
            AnimalFamily(type: .mammal, animals: self.mammalAnimals),
            AnimalFamily(type: .reptile, animals: self.reptileAnimals),
            AnimalFamily(type: .fish, animals: self.fishAnimals),
            AnimalFamily(type: .bird, animals: self.birdAnimals),
        ]
    }
    
    private let amphibians: [Animal] = [
        Animal(name: "Frog"),
        Animal(name: "Crocodile"),
        Animal(name: "Alligator"),
        Animal(name: "Monitor lizard"),
        Animal(name: "Salamander"),
        Animal(name: "Toad"),
        Animal(name: "Newt"),
        Animal(name: "Iguana"),
        Animal(name: "Snake"),
        Animal(name: "Green dragon lizard"),
    ]
    
    private let mammals: [Animal] = [
        Animal(name: "Lion"),
        Animal(name: "Tiger"),
        Animal(name: "Goat"),
        Animal(name: "Horse"),
        Animal(name: "Donkey"),
        Animal(name: "Dog"),
        Animal(name: "Cat"),
        Animal(name: "Pig"),
        Animal(name: "Panther"),
        Animal(name: "Leopard"),
        Animal(name: "Cheetah"),
        Animal(name: "Cow"),
        Animal(name: "Walrus"),
        Animal(name: "Otter"),
        Animal(name: "Giraffe"),
        Animal(name: "Sheep"),
        Animal(name: "Rabbit"),
        Animal(name: "Monkey"),
    ]
    
    private let reptiles: [Animal] = [
        Animal(name: "Snake"),
        Animal(name: "Crocodile"),
        Animal(name: "Alligator"),
        Animal(name: "Tortoise"),
        Animal(name: "Turtle"),
        Animal(name: "Lizard"),
        Animal(name: "Chameleon"),
        Animal(name: "Basilisk"),
        Animal(name: "Water moccasin"),
        Animal(name: "Gecko"),
    ]
    
    private let fishes: [Animal] = [
        Animal(name: "Herring"),
        Animal(name: "Crab"),
        Animal(name: "Brill"),
        Animal(name: "Haddock"),
        Animal(name: "Eel"),
        Animal(name: "Whale"),
        Animal(name: "Blue whale"),
        Animal(name: "Salmon"),
        Animal(name: "Sardines"),
        Animal(name: "Pike"),
        Animal(name: "Carp"),
        Animal(name: "Shark"),
        Animal(name: "Tuna"),
        Animal(name: "Pufferfish"),
        Animal(name: "Blue tang"),
    ]
    
    private let birds: [Animal] = [
        Animal(name: "Flamingo"),
        Animal(name: "Crow"),
        Animal(name: "Hen"),
        Animal(name: "Vulture"),
        Animal(name: "Eagle"),
        Animal(name: "Peacock"),
        Animal(name: "Pigeon"),
        Animal(name: "Emu"),
        Animal(name: "Ostrich"),
        Animal(name: "Dove"),
        Animal(name: "Stork"),
    ]
    
    func generateRandomAnimal(for type: AnimalType) -> Void {
        switch type {
        case .amphibian:
            self.generateSingleAmphibian()
        case .mammal:
            self.generateSingleMammal()
        case .reptile:
            self.generateSingleReptile()
        case .fish:
            self.generateSingleFish()
        case .bird:
            self.generateSingleBird()
        }
    }
    
    func generateAllSingleRandomAnimal() -> Void {
        self.generateSingleAmphibian()
        self.generateSingleMammal()
        self.generateSingleReptile()
        self.generateSingleFish()
        self.generateSingleBird()
    }
    
    private func generateSingleAmphibian() -> Void {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            guard let oldFamily = self.animalFamilies.first (where: { $0.type == .amphibian &&
                $0.animals == self.amphibianAnimals }) else { return }
            
            self.amphibianAnimals.append(self.amphibians.randomElement() ?? Animal.empty)
            let newFamily = AnimalFamily(type: .amphibian, animals: self.amphibianAnimals)
            
            for (index, family) in self.animalFamilies.enumerated() where family == oldFamily {
                self.animalFamilies.remove(at: index)
                self.animalFamilies.insert(newFamily, at: index)
            }
            
            self.isLoading = false
        }
    }
    
    private func generateSingleMammal() -> Void {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            guard let oldFamily = self.animalFamilies.first (where: { $0.type == .mammal &&
                $0.animals == self.mammalAnimals }) else { return }
            
            self.mammalAnimals.append(self.mammals.randomElement() ?? Animal.empty)
            let newFamily = AnimalFamily(type: .mammal, animals: self.mammalAnimals)
            
            for (index, family) in self.animalFamilies.enumerated() where family == oldFamily {
                self.animalFamilies.remove(at: index)
                self.animalFamilies.insert(newFamily, at: index)
            }
            
            self.isLoading = false
        }
    }
    
    private func generateSingleReptile() -> Void {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            guard let oldFamily = self.animalFamilies.first (where: { $0.type == .reptile &&
                $0.animals == self.reptileAnimals }) else { return }
            
            self.reptileAnimals.append(self.reptiles.randomElement() ?? Animal.empty)
            let newFamily = AnimalFamily(type: .reptile, animals: self.reptileAnimals)
            
            for (index, family) in self.animalFamilies.enumerated() where family == oldFamily {
                self.animalFamilies.remove(at: index)
                self.animalFamilies.insert(newFamily, at: index)
            }
            
            self.isLoading = false
        }
    }
    
    private func generateSingleFish() -> Void {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            guard let oldFamily = self.animalFamilies.first (where: { $0.type == .fish &&
                $0.animals == self.fishAnimals }) else { return }
            
            self.fishAnimals.append(self.fishes.randomElement() ?? Animal.empty)
            let newFamily = AnimalFamily(type: .fish, animals: self.fishAnimals)
            
            for (index, family) in self.animalFamilies.enumerated() where family == oldFamily {
                self.animalFamilies.remove(at: index)
                self.animalFamilies.insert(newFamily, at: index)
            }
            
            self.isLoading = false
        }
    }
    
    private func generateSingleBird() -> Void {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            guard let oldFamily = self.animalFamilies.first (where: { $0.type == .bird &&
                $0.animals == self.birdAnimals }) else { return }
            
            self.birdAnimals.append(self.birds.randomElement() ?? Animal.empty)
            let newFamily = AnimalFamily(type: .bird, animals: self.birdAnimals)
            
            for (index, family) in self.animalFamilies.enumerated() where family == oldFamily {
                self.animalFamilies.remove(at: index)
                self.animalFamilies.insert(newFamily, at: index)
            }
            
            self.isLoading = false
        }
    }
}

