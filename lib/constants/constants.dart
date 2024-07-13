import 'package:flutter/material.dart';

const imageUrl = 'https://api.timbu.cloud/images/';
const apiKey = '2340030005154108b0b037ecb54c31b720240705123255632211';
const appId = 'L3H8EEJZDG7X3MF';
const organizationId = '72f5394fba944b46ba189d89ad0ded36';
// ignore: constant_identifier_names
const BASE_URL = 'https://api.timbu.cloud/products';

const Color primary = Color.fromRGBO(255, 127, 125, 1);

class Constants extends StatelessWidget {
  const Constants({super.key});
  static double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double deviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
//https://api.timbu.cloud/products?organization_id=2f5394fba944b46ba189d89ad0ded36&Appid=L3H8EEJZDG7X3MF&Apikey=2340030005154108b0b037ecb54c31b720240705123255632211
