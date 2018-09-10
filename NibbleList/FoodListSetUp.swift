//
//  FoodListSetUp.swift
//  NibbleList
//
//  Created by Herman Kwan on 1/25/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import Foundation

enum Marks: String {
    case checkMark
    case xMark
}

// Class to store title, image, and food description
class FoodItems {
    let title: String
    let image: Marks
    let desc: String
    
    init(title: String, image: Marks, desc: String) {
        self.title = title
        self.image = image
        self.desc = desc
    }
}

// Setting up the foodList's array items
func setUpFoodList() {
    foodList.append(FoodItems(title: "Pineapple", image: .checkMark, desc: "Yes. Raw pineapple, in small amounts, is an excellent snack for dogs. ... Plus, frozen pieces of fresh pineapple make a delicious treat in the summer. If your dog does not like pineapple, there are plenty of other fruits and vegetables that are safe for dogs to eat."))
    foodList.append(FoodItems(title: "Apple", image: .checkMark, desc: "Apple slices. Help to clean residue off a dog's teeth, which helps to freshen her breath. Apples are a good source of fiber as well as vitamin A and C. Make sure to take out the seeds and the core before feeding to your dog, as these can be choking hazards."))
    foodList.append(FoodItems(title: "Banana", image: .checkMark, desc: "Dogs can eat bananas in moderation. Bananas are a good source of potassium, manganese, vitamin B6, vitamin C, fiber, biotin and copper. Bananas are low in sodium and cholesterol, but due to the sugar content in bananas, dogs should only eat them as a treat, and not as a regular part of their diets."))
    foodList.append(FoodItems(title: "Chocolate", image: .xMark, desc: "Chocolate is made from the roasted seeds of cocoa plants and contains theobromine, a stimulant related to caffeine; both are toxic to pets. Eating too much chocolate shifts your puppy's heart into overdrive and can kill him. ... But puppies get into chocolate most often because of their curious nature."))
    foodList.append(FoodItems(title: "Rice", image: .checkMark, desc: "Brown rice is a little higher in protein and a little lower in fat when compared to white rice. White or instant rice is an easily digestible carbohydrate which makes it a good source of energy when your dog has an upset tummy or if you are feeding an older dog."))
    foodList.append(FoodItems(title: "Raisins", image: .xMark, desc: "Recently, veterinarians discovered that grapes, raisins and currants (fruits from Vitis species) can cause kidney failure in dogs. ... Whatever the case, the number of identified cases of illness or death in dogs after they have eaten raisins or grapes is on the rise."))
    foodList.append(FoodItems(title: "Coffee", image: .xMark, desc: "Pets are more sensitive to the effects of caffeine than people are. While 1-2 laps of coffee, tea or soda will not contain enough caffeine to cause poisoning in most pets, the ingestion of moderate amounts of coffee grounds, tea bags or 1-2 diet pills can easily cause death in small dogs or cats."))
    foodList.append(FoodItems(title: "Cheese", image: .xMark, desc: "Fatty, rich cheeses, and cheeses that contain herbs or food items harmful to dogs like garlic can cause intestinal upset."))
    foodList.append(FoodItems(title: "Tuna", image: .checkMark, desc: "When it comes to dogs, they can perfectly handle both forms of tuna fish, cooked or raw. But, if you're going to feed your dog raw tuna fish, make sure to remove all the bones at first. If you decide to feed your dog canned tuna, make sure that it's packed in water and not oil."))
    foodList.append(FoodItems(title: "Cheese Pizza", image: .xMark, desc: "Cheese: Although dogs can eat specific types of cheese, chances are that the cheese used in pizza is almost always very high in lactose content, and since most dogs out there are lactose intolerant, this is a big problem."))
    foodList.append(FoodItems(title: "Pepperoni", image: .checkMark, desc: "If your dog ate a lot of pepperoni you may be dealing with diarrhea and/or vomiting. Our advice is to not make a habit of giving this cured combo of pork and beef."))
    foodList.append(FoodItems(title: "Avocado", image: .xMark, desc: "They cause a mild stomach upset in some dogs due to a toxin called persin, but one of the bigger concerns is the pit. If eaten whole, it can cause a serious obstruction."))
    foodList.append(FoodItems(title: "Peanut Butter", image: .checkMark, desc: "If your puppy eats peanut butter regularly, it's good to give him/her the organic unsalted peanut butter. Too much salt can be harmful to the puppy."))
    foodList.append(FoodItems(title: "Salmon", image: .checkMark, desc: "These fats support the immune system and can be beneficial for skin and coat health. There has also been some indication that they may benefit dogs with allergies. You can feed salmon or salmon oil. If feeding salmon, make sure it's cooked before serving, as raw salmon can carry a parasite that can make your dog sick."))
    foodList.append(FoodItems(title: "Grapes", image: .xMark, desc: "Grape toxicity can be fatal when digesting the fruit lead to sudden kidney failure"))
    foodList.append(FoodItems(title: "Potato", image: .checkMark, desc: "Even a plain baked potato is OK. Don't let your dog eat any raw potatoes or any potato plants from your pantry or garden."))
    foodList.append(FoodItems(title: "Chicken", image: .checkMark, desc: "If your dog requires extra protein in his diet, cooked, unseasoned chicken is an easy addition to his regular food. It also makes a good meal replacement if you're out of dog food. ... However, it shouldn't make up more than 10 percent of a dog's diet as it could cause gastrointestinal irritation."))
    foodList.append(FoodItems(title: "Waffles", image: .checkMark, desc: "Waffle contains a lot of sugar and too much sugar is never good for your dog. If you want your dog to eat waffles, give small quantities and make sure it's sugarfree if possible."))
    foodList.append(FoodItems(title: "Test", image: .checkMark, desc: "Testing unit. Please disregard this message")) 
    currentFoodList = foodList.sorted { $0.title < $1.title }
}
