import 'package:flutter/material.dart';

class UserDetailsList extends StatefulWidget {
  const UserDetailsList({super.key});

  @override
  State<UserDetailsList> createState() =>
      _UserDetailsListState();
}

class _UserDetailsListState extends State<UserDetailsList> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          SizedBox(
            width: constraints.maxWidth,
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                  primary: true,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print('Se hizo clic en el elemento $index');
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: index.isEven
                                ? Colors.white
                                : Colors.pink.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Scrollable 2 : Index $index'),
                          )),
                    );
                  }),
            ),
          ),
        ],
      );
    });
  }
}
