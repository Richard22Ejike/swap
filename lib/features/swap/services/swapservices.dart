
import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';



import '../../../constants/GlobalVariables.dart';
import '../../../constants/Utils.dart';
import '../../../constants/errorHandling.dart';
import '../../../models/swapproduct.dart';
import '../../../providers/user_providers.dart';


class SwapServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic('donpd3pem', 'vhmdvidt');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      SwapProduct swapproduct = SwapProduct(
        name: name,
        description: description,
        images: imageUrls,
        userId: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/swap/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: swapproduct.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  Future<List<SwapProduct>> fetchAllSwapProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<SwapProduct> swapproductList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/swap/get-user-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            swapproductList.add(
              SwapProduct.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return swapproductList;
  }


}