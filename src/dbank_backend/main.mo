import Debug "mo:base/Debug";
// import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank{
 stable var currentValue  :Float = 300;
  currentValue:=100;

stable var  currentTime = Time.now();
  Debug.print(debug_show(currentTime));

  // let id = 123456789;
//  Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

public func topUp(amount: Float){
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };
  
public func withDraw(withDrawAmount:Float){
let tempValue: Float = currentValue-withDrawAmount;
 if(tempValue>=0){
  currentValue-=withDrawAmount;
   Debug.print(debug_show(currentValue));
 }
else{
  Debug.print("Cannot withdraw");
}
 
} ; 

// read only 

public query func checkBalance():async Float{
  return currentValue;

};

public func compound(){
 let startTime = Time.now();
let timeinNs = startTime-currentTime;
let currentTimeinNs = timeinNs/1000000000;
currentValue := currentValue*(1.01** Float.fromInt(currentTimeinNs));
currentTime:=timeinNs;


};


}