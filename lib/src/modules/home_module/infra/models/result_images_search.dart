// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields
import 'dart:convert';

import '../../domain/entities/application_images_entity.dart';

class ResultImagesSearchModel extends ApplicationImages {
  final String? url;
  final int? xAxis;
  final int? yAxis;
  final int? position;

  ResultImagesSearchModel({
    this.url,
    this.xAxis,
    this.yAxis,
    this.position,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'xAxis': xAxis,
      'yAxis': yAxis,
      'position': position,
    };
  }

  factory ResultImagesSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultImagesSearchModel(
      url: map['url'] != null ? map['url'] as String : null,
      xAxis: map['xAxis'] != null ? map['xAxis'] as int : null,
      yAxis: map['yAxis'] != null ? map['yAxis'] as int : null,
      position: map['position'] != null ? map['position'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultImagesSearchModel.fromJson(String source) =>
      ResultImagesSearchModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}