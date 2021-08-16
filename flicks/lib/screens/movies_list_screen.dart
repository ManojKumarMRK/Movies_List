import 'package:flicks/screens/add_movies_screen.dart';
import 'package:flicks/screens/edit_movies.dart';
import 'package:flicks/screens/details_screen.dart';
import 'package:flutter/material.dart';

class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  Widget _movieTile(int index) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => DetailsPage())),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(children: <Widget>[
            ListTile(
              title: Text("Movie name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  )),
              subtitle: Text("15 aug 2020",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  )),
              trailing: GestureDetector(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => EditMovie())),
                child: Wrap(
                  spacing: 12, // space between two icons
                  children: <Widget>[
                    Icon(Icons.edit), // icon-1
                    Icon(Icons.delete), // icon-2
                  ],
                ),
              ),
            ),
            Divider(),
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    int _count = 11;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddMovie())),
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.add)),
        body: ListView.builder(
            itemCount: _count,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Movies List",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Watched 10 movies",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ));
              } else if (index == _count - 1) {
                return SizedBox(
                  height: 40.0,
                );
              }
              return _movieTile(index);
            }));
  }
}
