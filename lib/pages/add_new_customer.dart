import 'package:flutter/material.dart';
import 'package:new_dish_admin_panlel/provider/public_provider.dart';
import 'package:new_dish_admin_panlel/widgets/button_widget.dart';
import 'package:new_dish_admin_panlel/widgets/form_decoration.dart';
import 'package:provider/provider.dart';

class AddNewCustomer extends StatefulWidget {

  @override
  _AddNewCustomerState createState() => _AddNewCustomerState();
}

class _AddNewCustomerState extends State<AddNewCustomer> {
  bool _isLoading=false;
  String? _deductKey;
  String? _package;
  List<String> _deductList = ['Vat','AIT','Others'];
  List<String> _packageList = ['Package-1','Package-2','Package-3', 'Package-4'];

  TextEditingController _name = TextEditingController(text: '');
  TextEditingController _address = TextEditingController(text: '');
  TextEditingController _billAmount = TextEditingController(text: '');
  TextEditingController _phone = TextEditingController(text: '');
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Container(
      width: publicProvider.pageWidth(size),
      child: Center(
        child: Container(
          height: size.height*.7,
          width: size.width*.7,
          padding: EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///Heading Text
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Text('Add New Customer by Giving Detailed Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.height*.02,
                    color: Colors.grey.shade900,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                SizedBox(height: size.height*.08),

                Row(
                  children: [
                    Expanded(child: _textBuilder(size, 'Name')),
                    SizedBox(width: size.height*.04),
                    Expanded(child: _textBuilder(size, 'Address')),
                  ],
                ),
                SizedBox(height: size.height*.04),

                Row(
                  children: [
                    Expanded(child: _textBuilder(size, 'Phone')),
                    SizedBox(width: size.height*.04),
                    Expanded(child: _textBuilder(size, 'Bill Amount')),
                  ],
                ),
                SizedBox(height: size.height*.04),

                Row(
                  children: [
                    ///Deduct Key Dropdown
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: size.height*.01),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isDense: true,
                            isExpanded: true,
                            value:_deductKey,
                            hint: Text('Select Deduct Key',style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: size.height*.022,)),
                            items:_deductList.map((category){
                              return DropdownMenuItem(
                                child: Text(category, style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: size.height * .022,fontFamily: 'OpenSans'
                                ),
                                ),
                                value: category,
                              );
                            }).toList(),
                            onChanged: (newValue)=> setState(()=>
                            _deductKey = newValue as String?),
                            dropdownColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.height*.04),
                    ///Package Dropdown
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: size.height*.01),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isDense: true,
                            isExpanded: true,
                            value:_package,
                            hint: Text('Select Package',style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: size.height*.022,)),
                            items:_packageList.map((category){
                              return DropdownMenuItem(
                                child: Text(category, style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: size.height * .022,fontFamily: 'OpenSans'
                                ),
                                ),
                                value: category,
                              );
                            }).toList(),
                            onChanged: (newValue)=> setState(()=>
                            _package = newValue as String?),
                            dropdownColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


                SizedBox(height: size.height*.08),

                GradientButton(
                    child: Text('Add Customer'),
                    onPressed: (){},
                    borderRadius: 5.0,
                    height: 40,
                    width: 250,
                    gradientColors: [
                      Color(0xff162B36),
                      Color(0xff006F64)
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textBuilder(Size size, String hint){
    return TextField(
      controller: hint=='Name'
          ?_name
          : hint=='Address'
          ?_address
          :hint=='Bill Amount'
          ?_billAmount
          :_phone,
      decoration: formDecoration(size).copyWith(
        labelText: hint
      ),
    );
  }
}
