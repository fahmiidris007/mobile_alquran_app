import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/common/constants/paths.dart';
import 'package:mobile_alquran_app/data/datasource/remote/api_client.dart';
import 'package:mobile_alquran_app/data/datasource/remote/api_exceptions.dart';
import 'package:mobile_alquran_app/data/models/surah_detail.dart';
import 'package:mobile_alquran_app/data/models/surah_list.dart';
import 'package:mobile_alquran_app/data/models/surah_search.dart';

class ApiServices {
  Future<List<SurahList>> getSurahList() async {
    try {
      final response = await ApiClient.instance.getList(Paths.listSurah);
      final listSurah =
      (response).map((e) => SurahList.fromJson(e)).toList();
      return listSurah;
    } on DioException catch (e) {
      var error = ApiErrors(e);
      throw error.errorMessage;
    }
  }

  Future<SurahDetail> getDetailSurah(int noSurat) async {
    try {
      final response =
          await ApiClient.instance.get("${Paths.detailSurah}$noSurat");
      return SurahDetail.fromJson(response);
    } on DioException catch (e) {
      var error = ApiErrors(e);
      throw error.errorMessage;
    }
  }

  Future<List<SurahSearch>> getSurahByQuery() async {
    try {
      final response = await ApiClient.instance.getList(Paths.listSurah);
      final listSurah =
      (response).map((e) => SurahSearch.fromJson(e)).toList();
      return listSurah;
    } on DioException catch (e) {
      var error = ApiErrors(e);
      throw error.errorMessage;
    }
  }
}
