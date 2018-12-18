//: Playground - noun: a place where people can play

import UIKit

func newLine(){
    print()
}

//（1）给定一个Dictionary，Dictionary包含key值name和age，用map函数返回age字符串数组;
let dicArr: [[String:Any]] = [["name":"Lucy","age":18],["name":"Tom","age":19]]
let ageArr = dicArr.map{ $0["age"]! }
print("返回的字符串组为：\(ageArr)")


//（2）给定一个String数组，用filter函数选出能被转成Int的字符串
newLine()
let strArr = [ "12","a","23","asdf","5","7","sad","89" ]
let filteredArr = strArr.filter{ Int($0) != nil }
print("能被转成Int的字符串数组：\(filteredArr)")


//（3）用reduce函数把String数组中元素连接成一个字符串，以逗号分隔
newLine()
let strArr2 = ["input","output","push","pull"]
var index = 0
let reducedArr = strArr2.reduce(""){
    if index < strArr2.count-1 {
        index = index + 1
        return $0 + $1 + ","
    }else {
        index = index + 1
        return $0 + $1
    }
}
print("拼接后的字符串：\(reducedArr)")



//（4）用 reduce 方法一次求出整数数组的最大值、最小值、总数和
newLine()
let intArr = [11,3,4,33,6,9,7]
let result = intArr.reduce((max:Int.min,min:Int.max,sum:0)){(result,i) in
    return (max(result.max, i),min(result.min, i),result.sum + i)
}
print("最大值为：\(result.max)，最小值为：\(result.min)，总和：\(result.sum)")


//（5）新建一个函数数组，函数数组里面保存了不同函数类型的函数，要求从数组里找出参数为一个整数，返回值为一个整数的所有函数；
newLine()
func func1() -> Void {
    print("func1")
}
func func2() -> Int {
    return 0
}
func func3(x:Int) -> Int {
    return x * 3
}
func func4(x:Int) -> Void {
    print("func4")
}
func func5(x:Int) -> Int {
    return x * 5
}
let funcs:[Any] = [func1,func2,func3,func4,func5]
print("该函数数组里参数为一个整数，返回值为一个整数的所有函数：",terminator: "")
for(key,value) in funcs.enumerated(){
    if value is (Int)->Int{
        print("func\(key+1) ",terminator:"")
    }
}
print("")


//（6）扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证；
newLine()
extension Int{
    func sqrt(num:Int) -> Double {
        return Darwin.sqrt(Double(num))
    }
}
print("sqrt(2)=\(sqrt(2))")



//（7）实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值，分别传入整数值、浮点数值、字符串进行验证。
newLine()
func findMaxAndMin<T:Comparable>(data:[T]) -> (max:T,min:T) {
    var max = data[0]
    var min = data[0]
    
    for i in data {
        if max < i {
            max = i
        }
        if min > i {
            min = i
        }
    }
    
    return (max,min)
}
let ints = [11,3,4,33,6,9,7]
var results = findMaxAndMin(data: ints)
print("\(ints)中的最大值为：\(results.max)，最小值为：\(results.min)")

