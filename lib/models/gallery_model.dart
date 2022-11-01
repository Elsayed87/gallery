class ImageModel {
  final List<String> image;

  ImageModel({required this.image});
  factory ImageModel.fromJson(json) {
    return ImageModel(image: getList(json['images']));
  }
  static List<String> getList(List<dynamic> list) {
    return List<String>.from(list);
  }
}

class DataModel {
  final List<ImageModel> imageList;

  DataModel({required this.imageList});
  factory DataModel.fromJson(json) {
    return DataModel(imageList: getList(json['data']));
  }
  static List<ImageModel> getList(List<dynamic> list) {
    List<ImageModel> data = list.map((e) => ImageModel.fromJson(e)).toList();
    return data;
  }
}



// {
//     "status": "success",
//     "data": {
//         "images": [
//             "https://technichal.prominaagency.com/media/1/IMG_1460.JPG",
//             "https://technichal.prominaagency.com/media/2/switch.zip"
//         ]
//     },
//     "message": "Gallery retrieved successfully"
// }