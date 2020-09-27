import UIKit

/* Name: Lauren (Lindsey) Yu
 PennKey: lindsyu
 App#: 1
 Looking forward to: creating a tangible interface for my ideas */


//Exercise 1
let foo: Double = 42
var fooStr: String? = String(foo)
//forced unwrapping
print ("My number is \(fooStr!)")
//optional binding
if let number = fooStr {
    print ("My number is \(number)")
}
//nil coalescing
let num: String = String(foo)
print ("My number is \(fooStr ?? num)")

//Exercise 2
var charArray: [Character] = ["c", "i", "s", "1", "9", "5", " ", "i", "s", " ", "f", "u", "n"]
let str = String(charArray) + "!"
print (str)
var peopleDict: [String: Int] = ["Biscuit" : 11, "Bert" : 18, "Anna" : 21]
dump(peopleDict)
var myInfo = ("Lindsey", 2022)
print (myInfo)

//Exercise 3
for (name, age) in peopleDict {
    if age < 21 {
        print ("My friend \(name) is under 21")
    } else {
         print ("My friend \(name) is not under 21")
    }
}
for num in 1...10 {
    print(num)
}
for char in str {
    print(char)
}

//Exercise 4
func sumAndDiff(_ num1: Int, _ num2: Int) -> (sum: Int, diff: Int) {
    if num2 > num1 {
        return (num1+num2, num2-num1)
    } else {
        return (num1+num2, num1-num2)
    }
}
typealias Course = String
typealias PennId = Int

func enroll(in course: Course, using pennId: PennId) {
    print ("Enrolled \(pennId) in \(course)")
}
let newCourse: String = "CIS195"
let myPennId: Int = 25648710
enroll(in: newCourse, using: myPennId)

//Exercise 5 and 6
struct Rectangle {
    var width = 0
    var height = 0
    var area: Int {
        get {
            return (width * height)
        }
    }
    var description: String? {
        didSet {
            if description != nil {
                print (description!)
            }
        }
    }
}
var myRect = Rectangle(width: 50, height: 18, description: "This is my rectangle!")
typealias School = String
typealias Major = String

class Student {
    var name: String
    var school: School?
    var major: Major = "undeclared"
    init(name: String, school: School, major: Major) {
        self.name = name
        self.school = school
        self.major = major
    }
    init(name: String) {
        self.name = name
    }
}
var me = Student(name: "Lindsey", school: "Penn", major: "CS")
var babyQuaker = Student(name: "Baby Q")
let majors = ["CS", "Astrophysics", "Pastry Chef"]
babyQuaker.major = majors.randomElement()!

myRect.description = "This is my rectangle"
print(myRect.area)
