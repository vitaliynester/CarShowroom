import 'package:carshowroom/Models/score_client_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScoreViewCard extends StatefulWidget {
  final ScoreClientModel scoreClientModel;
  ScoreViewCard({this.scoreClientModel});
  @override
  _ScoreViewCardState createState() => _ScoreViewCardState();
}

class _ScoreViewCardState extends State<ScoreViewCard> {
  bool payed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      decoration: BoxDecoration(
        color: Color(0xFF475366),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${widget.scoreClientModel.modelMark} ${widget.scoreClientModel.modelName}",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "${widget.scoreClientModel.equipmentName}",
                    style: TextStyle(color: Color(0xFFcdccd7)),
                  ),
                  Text(
                    "${widget.scoreClientModel.modelEngine}",
                    style: TextStyle(color: Color(0xFFcdccd7)),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Менеджер: ${widget.scoreClientModel.employeeName}",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "Дата оформления: ${DateFormat('yyyy-MM-dd').format(widget.scoreClientModel.dateTimeScore).toString()}",
                    style: TextStyle(color: Color(0xFFcdccd7)),
                  ),
                  Text(
                    "Итоговая стоимость: ${widget.scoreClientModel.finalPrice}",
                    style: TextStyle(color: Color(0xFFcdccd7)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          widget.scoreClientModel.payed == false
              ? Container(
                  height: 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: RaisedButton(
                      color: Color(0xFF272f40),
                      child: Text(
                        "Оплатить счет",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.scoreClientModel.payed = true;
                        });
                      },
                    ),
                  ),
                )
              : Column(
                  children: <Widget>[
                    Text(
                      "Статус оплаты: Оплачено",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "Дата оплаты: ${(DateFormat('yyyy-MM-dd kk:mm').format(widget.scoreClientModel.dateTimePayed))}",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
