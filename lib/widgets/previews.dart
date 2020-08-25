import 'package:flutter/material.dart';
import 'package:flutter_netflix_response_ui/model/content_model.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> previewList;

  const Previews({
    Key key,
    @required this.title,
    @required this.previewList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 165.0,
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: previewList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = previewList[index];
                return GestureDetector(
                  onTap: () => print(content.name),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        height: 130.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: content.color,
                            width: 4.0,
                          ),
                        ),
                      ),
                      Container(
                        height: 130.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black45,
                              Colors.transparent
                            ],
                            stops: [0.0, 0.25, 1.0],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: content.color,
                            width: 4.0,
                          ),
                        ),
                      ),
                      Positioned(
                        child: SizedBox(
                          height: 60.0,
                          child: Image.asset(content.titleImageUrl),
                        ),
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
