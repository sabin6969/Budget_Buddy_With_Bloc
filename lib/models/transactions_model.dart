class TransactionModel {
  String? timeStamp;
  num? amount;
  bool? isExpense;
  String? title;
  String? id;

  TransactionModel(
      {this.timeStamp, this.amount, this.isExpense, this.title, this.id});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    timeStamp = json["timeStamp"];
    amount = json["amount"];
    isExpense = json["isExpense"];
    title = json["title"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["timeStamp"] = timeStamp;
    data["amount"] = amount;
    data["isExpense"] = isExpense;
    data["title"] = title;
    data["id"] = id;
    return data;
  }
}
