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
    var calculation = ""
    var stillTypingNumber = false
    var tempNum:Float = 0.0
    
    //Defaulted functions
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    
    //Change +/- numbers for calculations
    @IBAction func inverseTapped(sender: AnyObject)
    {
        //Assign Calc text to temp number, force to FLOAT
        tempNum = NSString(string: calculatorDisplay.text!).floatValue
        
        //Get inverse
        tempNum = (tempNum*(-1))
        
        //Update Calc display
        calculatorDisplay.text=String(tempNum)
    }
    
    //This function handles the user selecting a number
    @IBAction func numberTapped(sender: AnyObject)
    {
        //Assign whatever the number clicked to a currentInput
        var currentInput = String(sender.currentTitle)
        
        //String converstion bug 'fix'
        //For some reason without this ever number gets inputted as <Optional("X")
        if (currentInput as NSString).containsString("Optional")
        {
            //Drop First 10 characters <Optional(">
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
            
            //Drop last two characters <")>
            currentInput=String(currentInput.characters.dropLast())
            currentInput=String(currentInput.characters.dropLast())
        }
        
        //If the user is still typing the question
        if stillTypingNumber
        {
            //If the user has not chosen a calculation
            calculatorDisplay.text = calculatorDisplay.text! + String(currentInput)
        }
        else //User is done calculation
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
        
        //Assign first number entered, force to FLOAT
        firstUserInput = NSString(string: calculatorDisplay.text!).floatValue
        
        //Assign the operation selected
        calculation = sender.currentTitle!!
    }
    
    //If the user wishes to calculate
    @IBAction func equalsTapped(sender: AnyObject)
    {
        //Set answer variable back to default
        answer = 0.0
        
        //Assign second number entered, force to FLOAT
        secondUserInput = NSString(string: calculatorDisplay.text!).floatValue
        
        //Check what operation was chosen
        if calculation == "+"
        {
            //adition
            answer = firstUserInput + secondUserInput
        }
        else if calculation == "-"
        {
            //subtraction
            answer = firstUserInput - secondUserInput
        }
        else if calculation == "X"
        {
            //multiplication
            answer = firstUserInput * secondUserInput
        }
        else if calculation == "/"
        {
            //Division
            answer = firstUserInput / secondUserInput
        }
        else if calculation == "%"
        {
            //Modulas
            answer = firstUserInput % secondUserInput
        }
        
        //Update Calc with answer
        calculatorDisplay.text = String(answer)
        
        //Set boolean to false, user is done typing question
        stillTypingNumber = false
    }
    
    //This function clears the screen
    @IBAction func clearScreenTapped(sender: AnyObject)
    {
        //Reset variables back to default
        stillTypingNumber = false
        firstUserInput = 0
        secondUserInput = 0
        calculation = ""
        
        //Wipe calculation screen
        calculatorDisplay.text="0.0"
    }
}

