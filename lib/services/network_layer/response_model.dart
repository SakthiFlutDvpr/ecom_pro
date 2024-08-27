class ResponseModel {
  int? status;
  dynamic data;

  ResponseModel({this.status, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] as Map<String, dynamic>;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
