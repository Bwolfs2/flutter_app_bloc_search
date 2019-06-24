import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = BlocProvider.getBloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtro"),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                child: TextField(
                  onChanged: (text){
                    bloc.data.add(text);
                  },
                  decoration: InputDecoration(
                    labelText: "Filtro",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<String>>(
                    stream: bloc.dataFlux,
                    builder: (_, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );

                      var data = snapshot.data;
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (_, i) {
                            return ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                  data[i].substring(0, 1),
                                ),
                              ),
                              title: Text(data[i]),
                            );
                          });
                    }),
              ),
            ],
          )),
    );
  }
}
