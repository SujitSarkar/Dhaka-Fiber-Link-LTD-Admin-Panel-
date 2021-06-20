import 'package:flutter/material.dart';
import 'package:new_dish_admin_panlel/provider/public_provider.dart';
import 'package:new_dish_admin_panlel/widgets/button_widget.dart';
import 'package:new_dish_admin_panlel/widgets/form_decoration.dart';
import 'package:new_dish_admin_panlel/widgets/head_account_table_body.dart';
import 'package:provider/provider.dart';

class HeadOfAccount extends StatefulWidget {

  @override
  _HeadOfAccountState createState() => _HeadOfAccountState();
}

class _HeadOfAccountState extends State<HeadOfAccount> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  bool _isLoading=false;
  TextEditingController _name = TextEditingController(text: '');
  TextEditingController _amount = TextEditingController(text: '');
  TextEditingController _details = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Container(
      width: publicProvider.pageWidth(size),
      child: Column(
        children: [
          Material(
            color: Color(0xff006F64),
            child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.lightGreenAccent,
                indicatorWeight: 5.0,
                tabs: [
                  Tab(child: Text(
                      'All Data',
                      style: TextStyle(fontSize: size.height*.02,
                          color: Colors.white,
                          fontFamily: 'OpenSans'))
                  ),
                  Tab(child: Text(
                      'Entry Data',
                      style: TextStyle(fontSize: size.height*.02,color: Colors.white,
                          fontFamily: 'OpenSans'))
                  )
                ]
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [
                  _allData(size, publicProvider),
                  _entryData(size, publicProvider),
                ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _allData(Size size, PublicProvider publicProvider)=>Container(
    child: Center(
      child: Column(
        children: [
          ///Search Header
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: publicProvider.pageWidth(size),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            decoration: formDecoration(size).copyWith(
                              labelText: 'Search by Name',
                            ),
                          ),
                        ),
                      ),

                      ///Search Button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.height * .008),
                        child: OutlinedButton(
                          onPressed: (){},
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: size.height*.011),
                              child: Icon(Icons.search,color: Colors.grey)),
                        ),
                      ),

                      ///Clear Button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.height * .008),
                        child: OutlinedButton(
                          onPressed: (){},
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: size.height*.011),
                              child: Icon(Icons.clear,color: Colors.redAccent)),
                        ),
                      ),

                      ///Reload Button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.height * .008),
                        child: OutlinedButton(
                          onPressed: (){},
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: size.height*.011),
                              child: Icon(Icons.refresh,color: Color(0xff006F64),)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),

          ///Table Header
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _tableHeaderBuilder(size, 'Name'),
                    _tableHeaderBuilder(size, 'Amount'),
                    _tableHeaderBuilder(size, 'Details'),
                  ],
                ),
                Divider(height: 5.0,color: Colors.grey.shade900)
              ],
            ),
          ),

          ///Table Body
          _isLoading
              ?Padding(
            padding:  EdgeInsets.only(top: 100),
            child: Center(child: spinCircle()),
          ): Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 50,
              itemBuilder: (context,index)=>HeadOfAccountTableBody(index: index),
            ),
          )
          //     :Center(child: Column(
          //   children: [
          //     SizedBox(height: 100),
          //     Text('কোন ডেটা নেই!',
          //         style: TextStyle(fontFamily: 'hindSiliguri',
          //             fontSize: size.height*.026,color: Color(0xffF5B454))),
          //     TextButton(
          //         onPressed: ()async{
          //           setState(()=>_isLoading=true);
          //           await databaseProvider.getBodliKhanaDataList().then((value){
          //             setState(()=>_isLoading=false);
          //           });
          //         },
          //         child: Text('রিফ্রেশ করুন',style: TextStyle(fontFamily: 'hindSiliguri',fontSize: size.height*.021,),)
          //     )
          //   ],
          // ))
        ],
      ),
    ),
  );

  Widget _entryData(Size size, PublicProvider publicProvider)=>Container(
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
                child: Text('Add Head of Account Information',
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
                  Expanded(child: _textBuilder(size, 'Amount')),
                ],
              ),
              SizedBox(height: size.height*.04),
              _textBuilder(size, 'Details'),

              SizedBox(height: size.height*.08),

              GradientButton(
                  child: Text('Save'),
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

  Widget _tableHeaderBuilder(Size size,String tableHeader){
    return Expanded(
      child: Container(
        // width: size.width<1300
        //     ?size.width*.111
        //     :size.width*.0888,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey.shade900)
        ),
        child: Text(
          tableHeader,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: size.height*.022,
              fontWeight: FontWeight.bold,
              fontFamily: 'hindSiliguri'
          ),),
      ),
    );
  }

  Widget _textBuilder(Size size, String hint){
    return TextField(
      controller: hint=='Name'
          ?_name
          : hint=='Amount'
          ?_amount
          :_details,
      maxLines:  hint=='Details'? 10:1,
      decoration: formDecoration(size).copyWith(
          labelText: hint
      ),
    );
  }
}
