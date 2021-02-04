//
//  SportsbookHomeScene.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import UIKit

public final class SportsbookHomeScene: UITableViewController {
    @IBOutlet var tblView: UITableView!
    
    public var interactor: SportsbookHomeInteractor!
    
    var serviceAPIObj = ServiceAPI()

    private var token: WebSocketClient.Token!
    
    var socketmodel : SocketModel?
    var socketmodelforOutcome : SocketModelForOutcomes?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        serviceAPIObj.vc = self
        navigationItem.title = "Sportsbook"
        
        tblView.estimatedRowHeight = 173
        tblView.rowHeight = UITableView.automaticDimension
        
        //Call API and stroed response in Tournamant Model
        serviceAPIObj.getAllDataFromURL()
        
        //                interactor.sportsbook()
        
        /****************************************************/
        /*  After getting data from Socket server that data will stored in two different model's 1.SocketModel and another is socketmodelforOutcome and after getting the reponse from server reload the table view data*/
        /****************************************************/
        token = WebSocketClient.shared.register { payload in
            do {
                if payload.contains("startTime") {
                    let socketmodel = try JSONDecoder().decode(SocketModel.self, from: Data(payload.utf8))
                    self.socketmodel = SocketModel(event: socketmodel.event, startTime: socketmodel.startTime)
                } else {
                    let socketmodel = try JSONDecoder().decode(SocketModelForOutcomes.self, from: Data(payload.utf8))
                    self.socketmodelforOutcome = SocketModelForOutcomes(outcome: socketmodel.outcome, price: socketmodel.price)
                }
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            } catch let jsonError {
                print("Json error : \(jsonError.localizedDescription)")
            }
        }
        
        /****************************************************/
        /****************************************************/
    }
}


/****************************************************/
/*  Create a extension for showing data on table view cell */
/****************************************************/
extension SportsbookHomeScene {
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as? TournamentCell
        
        //
        let event = serviceAPIObj.allTournamentData[indexPath.section].events
        
        var date = NSDate(timeIntervalSince1970:(event[indexPath.row].startTime))
        
        if(event[indexPath.row].id == socketmodel?.event){
            date = NSDate(timeIntervalSince1970:(socketmodel!.startTime))
        }
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "MM/dd/YYYY, hh:mm a"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        
        cell?.lblEventName.text = event[indexPath.row].name
        
        cell?.lblStartTime.text = "\(dateString)"
        
        let outComes = serviceAPIObj.allTournamentData[indexPath.section].events[indexPath.row].markets[0].outcomes //Get data and stored in Outcomes model
        
        cell?.lblOutcomesName1.text = outComes[0].name
        cell?.lblOutcomesName2.text = outComes[1].name
        
        if(outComes[indexPath.row].id == socketmodelforOutcome?.outcome){
            cell?.lblOutcomesPrice1.text = socketmodelforOutcome!.price
        }
        
        cell?.lblOutcomesPrice1.text = outComes[0].price
        
        if(outComes[indexPath.row].id == socketmodelforOutcome?.outcome){
            cell?.lblOutcomesPrice2.text = socketmodelforOutcome!.price
        }
        
        cell?.lblOutcomesPrice2.text = outComes[1].price
        
        if outComes.count > 2{
            if(outComes[indexPath.row].id == socketmodelforOutcome?.outcome){
                cell?.lblOutcomesPrice2.text = socketmodelforOutcome!.price
            }
            cell?.lblOutcomesName3.text = outComes[2].name
            cell?.lblOutcomesPrice3.text = outComes[2].price
        }else{
            cell?.lblOutcomesName3.isHidden = true
            cell?.lblOutcomesPrice3.isHidden = true
        }
        
        return cell!
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return serviceAPIObj.allTournamentData[section].name
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return serviceAPIObj.allTournamentData.count
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let outComes = serviceAPIObj.allTournamentData[indexPath.section].events[indexPath.row].markets[0].outcomes
        
        if outComes.count > 2{
            return 173
        }else{
            return 135
        }
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceAPIObj.allTournamentData[section].events.count
    }
}

