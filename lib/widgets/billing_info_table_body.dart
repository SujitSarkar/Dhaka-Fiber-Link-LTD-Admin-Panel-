import 'package:flutter/material.dart';
import 'package:new_dish_admin_panlel/provider/public_provider.dart';
import 'package:provider/provider.dart';

class BillingInfoTableBody extends StatelessWidget {
  int index;
  BillingInfoTableBody({required this.index});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider  = Provider.of<PublicProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _tableBodyBuilder(size, 'Ismail hossain Miah Kashem Miah', publicProvider),
              _tableBodyBuilder(size, '01830200087', publicProvider),
              _tableBodyBuilder(size, '01830200087',publicProvider),
              _tableBodyBuilder(size, 'HDhkashd7612455',publicProvider),
              _tableBodyBuilder(size, 'Jun-2021',publicProvider),
              _tableBodyBuilder(size, 'Jun-2021',publicProvider),
              _tableBodyBuilder(size, '700',publicProvider),
            ],
          ),
          SizedBox(height: 5.0),
          Divider(height: 5.0,thickness: 0.5,color: Colors.grey)
        ],
      ),
    );
  }

  Widget _tableBodyBuilder(Size size,String tableData,PublicProvider publicProvider){
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(),
        child:Text(
            tableData,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey.shade900,
                fontSize: size.height*.021,
                fontWeight: FontWeight.w400,
                fontFamily: 'OpenSans'
            ))

      ),
    );
  }
}
