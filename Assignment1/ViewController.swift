//  Author      : Tyler Cadeau
//  Number Num  : 200246900
//  Assignment  : Assignment1
//  File        : ViewController.swift
//  Date        : 02/05/2016

import UIKit

class ViewController: UIViewController
{
    //Variables
    var firstUserInput:Float = 0.0
    var secondUserInput:Float = 0.0
    var answer:Float = 0.0
    var operation = ""
    var stillTypingNumber = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    
    //This function handles the user selecting a number
    @IBAction func numberTapped(sender: AnyObject)
    {
        var currentInput = String(sender.currentTitle)
        
        //String converstion bug 'fix'
        if (currentInput as NSString).containsString("Optional")
        {
            //Cut off excess characters
            currentInput=String(currentInput.characters.dropFirst())
            currentInput=String(currentInput.characters.dropFirst())
            currentInput=String(currentInput.characters.dropFirst())
            currentInput=String(currentInput.characters.dropFirst())
            currentInput=String(currentInput.characters.dropFirst())
            currentInput=String(currentInput.characters.dropFirst())
            currentInput=String(currentInput.characters.dropFirst())
            currentInput=String(currentInput.characters.dropFirst())
            currentInput=String(currentInput.characters.dropFirst())
            currentInput=String(currentInput.characters.dropFirst())
            currentInput=String(currentInput.characters.dropLast())
            currentInput=String(currentInput.characters.dropLast())
        }
        
        if stillTypingNumber
        {
            //If the user has not chosen a calculation
            calculatorDisplay.text = calculatorDisplay.text! + String(currentInput)
        }
        else
        {
            //Update display with number
            calculatorDisplay.text = currentInput
            stillTypingNumber = true
        }
    }
    
    //This funciton handles the user selecting a calculation
    @IBAction func calculationTapped(sender: AnyObject)
    {
        //Set boolean to false
        stillTypingNumber = false
        
        //Assign first number entered
        firstUserInput = NSString(string: calculatorDisplay.text!).floatValue
        //Assign the operation selected
        operation = sender.currentTitle!!
        
        if operation == "+/-"
        {
            //Postive/negative converstion
            firstUserInput = (firstUserInput*(-1))
            calculatorDisplay.text=String(firstUserInput)
        }
    }
    
    //If the user wishes to calculate
    @IBAction func equalsTapped(sender: AnyObject)
    {
        //Set boolean to false
        stillTypingNumber = false
        
        //Set answer variable back to default
        answer = 0.0
        
        //Assign second number entered
        secondUserInput = NSString(string: calculatorDisplay.text!).floatValue
        
        //Check what operation was chosen
        if operation == "+"
        {
            //adition
            answer = firstUserInput + secondUserInput
        }
        else if operation == "-"
        {
            //subtraction
            answer = firstUserInput - secondUserInput
        }
        else if operation == "X"
        {
            //multiplication
            answer = firstUserInput * secondUserInput
        }
        else if operation == "/"
        {
            //Division
            answer = firstUserInput / secondUserInput
        }
        else if operation == "%"
        {
            //Modulas
            answer = firstUserInput % secondUserInput
        }
        
        calculatorDisplay.text = "\(answer)"
    }
    
    //This function clears the screen
    @IBAction func clearScreenTapped(sender: AnyObject)
    {
        //Reset variables back to default
        stillTypingNumber = false
        firstUserInput = 0
        secondUserInput = 0
        operation = ""
        
        //Wipe calculation screen
        calculatorDisplay.text="0"
        
    }
    
    
}

