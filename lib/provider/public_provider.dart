import 'package:flutter/material.dart';
import 'package:new_dish_admin_panlel/pages/about_us_page.dart';
import 'package:new_dish_admin_panlel/pages/add_bill_man.dart';
import 'package:new_dish_admin_panlel/pages/add_new_customer.dart';
import 'package:new_dish_admin_panlel/pages/all_customer_list.dart';
import 'package:new_dish_admin_panlel/pages/bank_book_page.dart';
import 'package:new_dish_admin_panlel/pages/bill_man_list.dart';
import 'package:new_dish_admin_panlel/pages/billing_info_page.dart';
import 'package:new_dish_admin_panlel/pages/cash_book_page.dart';
import 'package:new_dish_admin_panlel/pages/customer_problem_list.dart';
import 'package:new_dish_admin_panlel/pages/dashboard_page.dart';
import 'package:new_dish_admin_panlel/pages/due_bill_customer_list.dart';
import 'package:new_dish_admin_panlel/pages/head_of_account_page.dart';
import 'package:new_dish_admin_panlel/pages/paid_bill_customer_list.dart';
import 'package:new_dish_admin_panlel/pages/payment_request_list.dart';
import 'package:new_dish_admin_panlel/widgets/form_decoration.dart';


class PublicProvider extends ChangeNotifier{
  String _category='';
  String _subCategory='';

  String  get category=>_category;
  String get subCategory=> _subCategory;

  set subCategory(String value){
    _subCategory=value;
    notifyListeners();
  }
  set category(String value){
    _category=value;
    notifyListeners();
  }

  double pageWidth(Size size){
    if(size.width<1300) return size.width;
    else return size.width*.85;
  }

  String pageHeader(){
    if(_category.isNotEmpty && _subCategory.isNotEmpty) return '$_category  \u276D  $_subCategory';
    else if(_category.isEmpty && _subCategory.isNotEmpty) return '$_subCategory';
    else return 'Dashboard';
  }

  Widget pageBody(){
    if(_subCategory=='Add New Customer') return AddNewCustomer();
    else if(_subCategory=='All Customer') return AllCustomerList();
    else if(_subCategory=='Due Bill Customer') return DueBillCustomerList();
    else if(_subCategory=='Paid Bill Customer') return PaidBillCustomerList();
    else if(_subCategory=='Customer Problem List') return CustomerProblemList();
    else if(_subCategory=='Add Bill Man') return AddBillMan();
    else if(_subCategory=='All Bill Man') return BillManList();
    else if(_subCategory=='Payment Request') return PaymentRequestList();
    else if(_subCategory=='Billing Info') return BillingInfoPage();
    else if(_subCategory=='About Us') return AboutUsPage();
    else if(_subCategory=='Head of Account') return HeadOfAccount();
    else if(_subCategory=='Cash Book') return CashBook();
    else if(_subCategory=='Bank Book') return BankBookPage();
    return DashBoardPage();
  }

  // Future<bool> validateAdmin(BuildContext context, String phone, String password)async{
  //   try{
  //     QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Admin')
  //         .where('phone', isEqualTo: phone).get();
  //     final List<QueryDocumentSnapshot> user = snapshot.docs;
  //     if(user.isNotEmpty && user[0].get('password')==password){
  //       return true;
  //     }else{
  //       return false;
  //     }
  //   }catch(error){
  //     showToast(error.toString());
  //     return false;
  //   }
  // }
}