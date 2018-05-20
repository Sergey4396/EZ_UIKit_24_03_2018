//
//  CommandVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 18.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class CommandVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        let account = AccountCommand(accountName: "SSR", ballance: 100000)
        let transactionManager = TransactionManagerCommand.shared
        transactionManager.addTransactions(command: DepositCommand(account: account, ammount: 777))
        transactionManager.addTransactions(command: WithdrawCommand(account: account, ammount: 1777))
        print(transactionManager.pandingTransactions)
        print("account.ballance")
        print(account.ballance)
        transactionManager.processingTransactions()
        print("account.ballance")
        print(account.ballance)
        // Do any additional setup after loading the view.
    }

 

}
class AccountCommand{
    var accountName: String
    var ballance: Int
    init(accountName: String, ballance: Int) {
        self.accountName = accountName
        self.ballance = ballance
    }
}

protocol CommandCommand {
    func execute()
    var isComplete: Bool{get set}
    
}
class DepositCommand: CommandCommand{
  
    private var _account: AccountCommand
    private var _amount: Int
    
        var isComplete = false
    
    init(account: AccountCommand, ammount: Int) {
        self._account = account
        self._amount = ammount
    }
    func execute() {
        _account.ballance += _amount
        isComplete = true
        
    }
  
}

class WithdrawCommand: CommandCommand{
    
    private var _account: AccountCommand
    private var _amount: Int
    
    var isComplete = false
    
    init(account: AccountCommand, ammount: Int) {
        self._account = account
        self._amount = ammount
    }
    func execute() {
        if _account.ballance >= -_amount{
        _account.ballance -= _amount
        isComplete = true
        }
        else {
            print("Not enouth money")
        }
    }
    
}
class TransactionManagerCommand{
    static let shared = TransactionManagerCommand()
    private init(){}
    private var _transactions: [CommandCommand] = []
    
    var pandingTransactions : [CommandCommand]{
        get{
            return self._transactions.filter{$0.isComplete == false}
        }
    }
    
    func addTransactions(command: CommandCommand){
        self._transactions.append(command)
    }
    func processingTransactions(){
        _transactions.filter{$0.isComplete == false}.forEach{$0.execute()}
    }
    
}
