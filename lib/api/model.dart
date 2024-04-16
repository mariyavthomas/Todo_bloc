class Modeltodo{
  String ? sId;
  String  ? title;
  String ? description;
  bool ? iscomplated;
  String ? createAt;
  String ? updatedat;
  Modeltodo({
this.sId,
this.title,
this.description,
this.iscomplated,
this.createAt,
this.updatedat
  });
  Modeltodo.fromJson(Map<String,dynamic>json){
    sId=json['_id'];
    title=json['title'];
    description=json['description'];
    iscomplated=json['is_completed'];
    createAt=json['created_at'];
    updatedat=json['updated_at'];
  }
  Map<String,dynamic>tojson(){
     final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['is_completed'] = this.iscomplated;
    data['created_at'] = this.createAt;
    data['updated_at'] = this.updatedat;
    return data;
  }
}