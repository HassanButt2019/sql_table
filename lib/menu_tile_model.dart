class MenuTileModel{
  String menuName;
  int id;
  int imageName;
  MenuTileModel({
    required this.menuName,
    required this.id,
    required this.imageName
});
  factory MenuTileModel.fromMap(Map<String,dynamic> map){
    return MenuTileModel(menuName: map['MenuName'], id: map['ID'],
        imageName: map['ImageName']);
  }

}