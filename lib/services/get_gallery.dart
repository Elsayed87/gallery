import 'dart:convert';

import 'package:flutter_gallery/models/gallery_model.dart';
import 'package:flutter_gallery/models/user_model.dart';
import 'package:http/http.dart' as http;

const Url = 'https://technichal.prominaagency.com/api/my-gallery';
const tokenx =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDY0ZTYzMGRhNTM5N2ExMjQ4YmE5NTM4NDJmYzg4NGNkMGU0ZjQ2ZDJlODM5MzFjN2VmNjdjNGRlNDI2NWVhM2I0MjczY2QzODI4ZTkyODkiLCJpYXQiOjE2NjczMjE2OTkuNzM5NTA1LCJuYmYiOjE2NjczMjE2OTkuNzM5NTExLCJleHAiOjE2OTg4NTc2OTkuNzM4MDIxLCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.ciLfXZMz6SH5bEFIrrID3wURr-V66mnJ3BBpaYGz4Ykp3R5phff5l7m3lD7veWKxQBIHqdGWvmjtMhn63nZgSXYMPjI6yIZ0qFuU3lNF6eNY4srw77xp-BCBBppqV-5k8NHdhAvEYHijH2BK3LAaPLYjFSusgOXLlouswkvL56fO8Z9QKVtwi-q8XJPRbL3CiPm1h8JxJUkWxSq3-6CeJrLvpvBdKYu0TirzLrfsEoUZtEjbKRDsMWLYgxNK5GBPpEuanOIli4QbTqvSQqSxFqPX-V3uFRv2ASEaIk3mwVfrhEbBShe35YScOOM88wQSQTIa3506aszfqUnpqRtYR3elY6xlx-U3V6KZsKDtAsKsDEDxjoafE4bmn5IgnqRwk-CoYuISWJEpQfNgBSjTpYd0F68Km8QZfnwVVvdeGilWVEcdYTUE70PYnYUyNdDCqL-vb1F_CMDXWOBM6S5oopNnOA-3DTluooZ8C2EpeJdadtINQtcdiX5vxVBxyDCv-aB_Jr6yWVGsyB8q-UmrfhM9ZPA8d9_ZNYuYOV-eBth4TRXgT6SghzhEOOciiV5HVMt7Oa1kfX_Qr6G46OffcGI6ndVYJ0odwLjlOhdo0Tkx3qd2uJTpGlVC1Q2NngIOPLWQbNnsauhgqYtngJDEU55FFvticUdS04rzsTFfbVU';
late UserDataModel user;

class ApiGetGallery {
  Future<List<ImageModel>> getGalleryService() async {
    var token = user.token;
    print(token);
    http.Response response = await http
        .get(Uri.parse(Url), headers: {'Authorization': 'Bearer ${token}'});
    var json = jsonDecode(response.body);

    DataModel dataModel = DataModel.fromJson(json);
    // print(dataModel.imageList.length);
    return dataModel.imageList;
  }
}
