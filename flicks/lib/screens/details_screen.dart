import 'package:flutter/material.dart';
import 'package:flicks/screens/edit_movies.dart';

class DetailsPage extends StatelessWidget {
  final String _imgpath =
      "https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              child: Column(
                children: <Widget>[
                  //gesture detector for back button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios_new,
                        color: Theme.of(context).primaryColor, size: 30.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  //Movie name
                  Text(
                    "MOVIE NAME",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //Adding Director name
                  Text(
                    "Directed by DirectorZ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  //Created date
                  Text(
                    "Added on 16.8.2020",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //Space for poster images
                  Container(
                      constraints: BoxConstraints.expand(height: 200.0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Image.network(
                        _imgpath,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  //Edit and delete buttons
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: TextButton(
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => EditMovie())),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10.0, 0, 20.0),
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: TextButton(
                      child: Text(
                        "Delete",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  )
                ],
              )),
        ],
      ),
    ));
  }
}
